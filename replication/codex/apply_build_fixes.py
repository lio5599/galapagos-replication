"""Record minimal build compatibility fixes; never modify generated variants."""
import difflib
import json
from pathlib import Path
import sys

root = Path(sys.argv[1])
files = ["scripts/verifier/alive/smt/smt.h", "scripts/verifier/alive/tools/alive_lexer.h"]
for name in files:
    header = root / name
    before = header.read_text()
    if "#include <cstdint>" not in before:
        if "#include <string>" not in before:
            raise SystemExit("Unexpected Alive2 header layout; inspect before patching: " + name)
        after = before.replace("#include <string>", "#include <cstdint>\n#include <string>", 1)
        header.write_text(after)
        patch = ''.join(difflib.unified_diff(before.splitlines(True), after.splitlines(True),
            fromfile="a/" + name, tofile="b/" + name))
        with (root / "replication/codex/alive2-cstdint.patch").open('a') as output:
            output.write(patch)
record = {"files": files, "change": "Add #include <cstdint> to two headers that use uint64_t",
          "reason": "Pinned Alive2 uses uint64_t without directly including its standard header; GCC 13 build fails",
          "scope": "Build compatibility only; no algorithm, verifier options, prompts, or generated code changed"}
(root / "replication/codex/build-compatibility.json").write_text(json.dumps(record, indent=2))
print(record["change"] + ": present; recorded build compatibility adjustment")
