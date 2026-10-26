#!/usr/bin/env python3
"""
Turn raw model responses into the per-variant files the Galápagos pipeline
consumes, replacing what generate_variants.py + split_variants.py did.

Reads   runs/<run>/responses/<project>/<lang>/<i>_<name>.txt
Writes  runs/<run>/variants/<project>/<lang>/<i>_<name>_<j>.<lang>.raw   j = 0..9
        runs/<run>/variants/<project>/<lang>/<i>_<name>.c.variants      (all code, for the record)
        runs/<run>/explanations/<project>/<lang>/<i>_<name>.txt         (non-code text, e.g. CoT)
        runs/<run>/ingest_report.json

Why not just reuse split_variants.py? It finds variants by searching for the
literal return type from functions_info.json (e.g. "static inline int") or the
word "func", so any prose ("function ...") or a model that drops "inline"
breaks it, and it calls exit(-1) past 20 matches. This script splits on real
top-level function definitions instead (comment- and string-aware brace
matching) and keeps the rest of the original behaviour:
  * each variant is only the function text: #include / package / import lines
    are dropped, exactly as split_variants.py dropped them
  * every top-level function in the reply counts as a variant, in order, so a
    helper function or a renamed copy still "uses up" a slot and fails later,
    as it would have in the paper
  * if a reply has fewer than 10 functions, the missing slots get a
    placeholder that fails to compile, so they are counted as failures
    instead of crashing template_variants.py (which hard-codes 10)

Go naming: in-project compilation looks up the Go function by the mangled name
stored in functions_info.json (fn_bc_name_go), which the authors set from
GPT-4o's own naming (flacGetMaxFrameSize, vp5_adjust, ...). A new model that
picks a different spelling of the same name would fail for that reason alone.
By default, names that differ only in case/underscores are renamed to the
expected one and counted in the report; real renames (suffixes like _v2) are
left alone so they still fail. Use --no-go-rename for the strict behaviour.
"""
import argparse
import json
import os
import re
import sys

PROJECTS = ["alsa-lib", "ffmpeg", "libgcrypt", "liboqs", "libsodium", "openssl"]


def default_galapagos():
    """$GALAPAGOS, else the repo this folder sits in, else ~/Galapagos."""
    if os.environ.get("GALAPAGOS"):
        return os.environ["GALAPAGOS"]
    parent = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    if os.path.isdir(os.path.join(parent, "functions")):
        return parent
    return os.path.expanduser("~/Galapagos")
FENCE_RE = re.compile(r"```[ \t]*([A-Za-z0-9_+#-]*)[^\n]*\n(.*?)```", re.S)
THINK_RE = re.compile(r"<think>.*?</think>", re.S | re.I)
CODE_TAGS = {"", "c", "h", "go", "golang", "cpp", "c++", "cc"}
SKIP_LINE_RE = re.compile(r"^\s*(#|package\s|import\s|import\()")


# ----------------------------------------------------------- code extraction --
def extract_code(text):
    """Return (code, prose). Fenced blocks win; otherwise mimic parse_response()."""
    text = THINK_RE.sub("", text)
    blocks = [(tag.lower(), body) for tag, body in FENCE_RE.findall(text)]
    blocks = [b for t, b in blocks if t in CODE_TAGS]
    if blocks:
        prose = FENCE_RE.sub("\n", text).strip()
        return "\n\n".join(blocks), prose
    # same regex as generate_variants.parse_response
    code = re.sub(r'```[CcGg][CcOo]?[Pp]?[Pp]?', '', text).replace('\\"', '"').replace('```', '')
    return code, ""


def scan_top_level(code, lang):
    """Yield (header_text, body_start, body_end) for each top-level {...} block."""
    i, n = 0, len(code)
    depth = 0
    item_start = 0
    open_pos = None
    while i < n:
        c = code[i]
        nxt = code[i + 1] if i + 1 < n else ""
        if c == "/" and nxt == "/":
            j = code.find("\n", i)
            i = n if j == -1 else j
            continue
        if c == "/" and nxt == "*":
            j = code.find("*/", i + 2)
            i = n if j == -1 else j + 2
            continue
        if c in "\"'" or (c == "`" and lang == "go"):
            q = c
            i += 1
            while i < n and code[i] != q:
                if code[i] == "\\" and q != "`":
                    i += 1
                elif code[i] == "\n" and q != "`":
                    break
                i += 1
            i += 1
            continue
        if depth == 0 and c == "#" and (i == 0 or code[i - 1] == "\n"):
            j = code.find("\n", i)  # preprocessor line at top level
            i = n if j == -1 else j
            continue
        if c == "{":
            if depth == 0:
                open_pos = i
            depth += 1
        elif c == "}":
            depth -= 1
            if depth == 0 and open_pos is not None:
                yield code[item_start:open_pos], open_pos, i + 1
                item_start = i + 1
                open_pos = None
            depth = max(depth, 0)
        elif c == ";" and depth == 0:
            item_start = i + 1
        i += 1


GO_IMPORT_GROUP_RE = re.compile(r"^\s*import\s*\(.*?\)\s*$", re.S | re.M)
COMMENT_RE = re.compile(r"//[^\n]*|/\*.*?\*/", re.S)


def clean_header(header):
    """Drop #include/#define, package and import lines (split_variants.py never kept them)."""
    dropped = [m.group(0).strip() for m in GO_IMPORT_GROUP_RE.finditer(header)]
    header = GO_IMPORT_GROUP_RE.sub("", header)
    kept = []
    for line in header.splitlines():
        (dropped if SKIP_LINE_RE.match(line) else kept).append(line.strip() if SKIP_LINE_RE.match(line) else line)
    return "\n".join(kept).strip("\n").strip(), dropped


def function_name(header, lang):
    """Name of the function a header declares, or None if it is not a function header."""
    h = COMMENT_RE.sub(" ", header).strip()
    if lang == "go":
        m = re.search(r"\bfunc\s*(\([^)]*\)\s*)?([A-Za-z_]\w*)\s*\(", h)
        return m.group(2) if m else None
    # C: header must end with the parameter list, e.g. "static inline int f(int a, int b)"
    m = re.search(r"([A-Za-z_]\w*)\s*\([^()]*(?:\([^()]*\)[^()]*)*\)\s*$", h, re.S)
    if not m or m.group(1) in ("if", "while", "for", "switch", "sizeof", "__attribute__"):
        return None
    return m.group(1)


def split_functions(code, lang, return_prefix=None):
    """Top-level function definitions in order.

    Like split_variants.py, each variant starts at the declared return type
    from functions_info.json (C) or at "func" (Go) when that text is present,
    so the files match what the original pipeline produced. (For five liboqs /
    libgcrypt functions functions_info.json says "int" where the source says
    "static int", and split_variants.py therefore dropped "static"; this keeps
    that behaviour.) If the model changed the prefix, the whole header is kept.
    """
    funcs = []
    for header, b0, b1 in scan_top_level(code, lang):
        hdr, dropped = clean_header(header)
        name = function_name(hdr, lang)
        if name is None:
            continue  # struct/enum/initializer or other non-function block
        trailing = header[len(header.rstrip()):]
        sep = "\n" if "\n" in trailing else " "
        start_at = "func" if lang == "go" else return_prefix
        bare = COMMENT_RE.sub(" ", hdr).strip()
        if start_at:
            k = bare.find(start_at)
            if k != -1 and name in bare[k:]:
                hdr = bare[k:]
        funcs.append({"name": name, "text": hdr + sep + code[b0:b1], "dropped_lines": dropped})
    return funcs


# ------------------------------------------------------------------ naming --
def expected_go_name(fn):
    mangled = fn.get("fn_bc_name_go") or ""
    return mangled.split(".", 1)[-1].replace("__", "_") if mangled else None


def norm(name):
    return re.sub(r"_", "", name or "").lower()


def rename_go(text, old, new):
    return re.sub(r"\b%s\s*\(" % re.escape(old), new + "(", text)


def placeholder(lang, fid, j):
    if lang == "c":
        return f'#error "variant {fid}_{j} missing from model response"\n'
    return f"MISSING_VARIANT_{j}_FROM_MODEL_RESPONSE\n"


# -------------------------------------------------------------------- main --
def ingest_one(resp_path, fn, fid, lang, n, go_rename):
    with open(resp_path) as f:
        text = f.read()
    code, prose = extract_code(text)
    funcs = split_functions(code, lang, fn.get("return") if lang == "c" else None)
    want = fn["name"] if lang == "c" else expected_go_name(fn)
    entry = {"functions_found": len(funcs), "extra_dropped": max(0, len(funcs) - n),
             "name_mismatch": [], "go_renamed": [], "dropped_lines": [], "missing_ids": []}
    variants = []
    for j, f in enumerate(funcs[:n]):
        body = f["text"]
        if f["dropped_lines"]:
            entry["dropped_lines"].append({"variant": j, "lines": f["dropped_lines"]})
        if f["name"] != want:
            if lang == "go" and go_rename and f["name"] and norm(f["name"]) == norm(want):
                body = rename_go(body, f["name"], want)
                entry["go_renamed"].append({"variant": j, "from": f["name"], "to": want})
            else:
                entry["name_mismatch"].append({"variant": j, "found": f["name"], "expected": want})
        variants.append(body.strip() + "\n")
    for j in range(len(variants), n):
        variants.append(placeholder(lang, fid, j))
        entry["missing_ids"].append(f"{fid}_{j}")
    return variants, code, prose, entry


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--run", required=True)
    ap.add_argument("--galapagos", default=default_galapagos())
    ap.add_argument("--n-variants", type=int, default=10)
    ap.add_argument("--no-go-rename", action="store_true", help="never rename Go functions")
    args = ap.parse_args()

    run = os.path.abspath(args.run)
    report = []
    for project in PROJECTS:
        info_path = os.path.join(args.galapagos, "functions", project, "functions_info.json")
        with open(info_path) as f:
            info = json.load(f)
        for lang in ("c", "go"):
            rdir = os.path.join(run, "responses", project, lang)
            if not os.path.isdir(rdir):
                continue
            vdir = os.path.join(run, "variants", project, lang)
            edir = os.path.join(run, "explanations", project, lang)
            os.makedirs(vdir, exist_ok=True)
            for i, fn in enumerate(info):
                fid = f"{i}_{fn['name']}"
                resp = os.path.join(rdir, f"{fid}.txt")
                base = {"project": project, "lang": lang, "function": fn["name"], "id": fid}
                if not os.path.exists(resp) or os.path.getsize(resp) == 0:
                    # template_variants.py loops over every function, so write
                    # failing placeholders rather than leave gaps (pilot runs).
                    for j in range(args.n_variants):
                        with open(os.path.join(vdir, f"{fid}_{j}.{lang}.raw"), "w") as f:
                            f.write(placeholder(lang, fid, j))
                    base.update({"status": "no_response",
                                 "missing_ids": [f"{fid}_{j}" for j in range(args.n_variants)]})
                    report.append(base)
                    continue
                variants, code, prose, entry = ingest_one(resp, fn, fid, lang, args.n_variants,
                                                          not args.no_go_rename)
                for j, v in enumerate(variants):
                    with open(os.path.join(vdir, f"{fid}_{j}.{lang}.raw"), "w") as f:
                        f.write(v)
                with open(os.path.join(vdir, f"{fid}.c.variants"), "w") as f:
                    f.write(code)
                if prose:
                    os.makedirs(edir, exist_ok=True)
                    with open(os.path.join(edir, f"{fid}.txt"), "w") as f:
                        f.write(prose)
                meta_path = resp.replace(".txt", ".meta.json")
                if os.path.exists(meta_path):
                    with open(meta_path) as f:
                        entry["stop_reason"] = json.load(f).get("stop_reason")
                base.update(entry)
                base["status"] = "ok" if not entry["missing_ids"] else "incomplete"
                report.append(base)

    with open(os.path.join(run, "ingest_report.json"), "w") as f:
        json.dump(report, f, indent=2)

    if not report:
        sys.exit(f"No responses found under {run}/responses")
    n_fn = len(report)
    missing = sum(len(r.get("missing_ids", [])) for r in report)
    mism = sum(len(r.get("name_mismatch", [])) for r in report)
    ren = sum(len(r.get("go_renamed", [])) for r in report)
    extra = sum(r.get("extra_dropped", 0) for r in report)
    print(f"Ingested {n_fn} function/language pairs -> {n_fn * args.n_variants} variant slots")
    print(f"  missing (placeholder written): {missing}")
    print(f"  extra functions beyond {args.n_variants} (ignored): {extra}")
    print(f"  name differs from expected (left as is, will fail in-project): {mism}")
    print(f"  Go names normalised to fn_bc_name_go: {ren}")
    for r in report:
        if r.get("status") != "ok":
            print(f"  ! {r['project']}/{r['lang']}/{r['id']}: {r['status']}, "
                  f"{len(r.get('missing_ids', []))} missing")
    print(f"Report: {os.path.join(run, 'ingest_report.json')}")


if __name__ == "__main__":
    main()
