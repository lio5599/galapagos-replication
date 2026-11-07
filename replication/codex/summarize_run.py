"""Report evidence without turning missing checks into failures or passes."""
import argparse
import json
from pathlib import Path


def summarize(run):
    manifest = json.loads((run / "generation.json").read_text())
    root = Path(__file__).resolve().parents[2]
    rows = []
    for project, names in manifest["selection"].items():
        info = json.loads((root / f"functions/{project}/functions_info.json").read_text())
        for i, fn in enumerate(info):
            if fn["name"] not in names:
                continue
            fid = f"{i}_{fn['name']}"
            reply = run / "replies" / project / (fid + ".txt")
            files = list((run / "results" / project / "c" / fid).glob("*.result.json"))
            data = [json.loads(p.read_text()) for p in files]
            verified = sum(any((v or {}).get("correct transformations", 0) > 0
                               for v in (d.get("verification") or {}).values()) for d in data)
            meta = run / "replies" / project / (fid + ".meta.json")
            split = json.loads(meta.read_text()).get("galapagos_split_count") if meta.exists() else None
            compiled_alone = len(list((run / "isolation" / project).glob(fid + "_*.bc")))
            rows.append(dict(project=project, function=fn["name"], requested=10,
                generated=reply.exists(), split_count=split, validation_records=len(data),
                compiled_in_isolation=compiled_alone if (run / "isolation" / project).exists() else None,
                compiled_in_project=sum(d.get("compiled") is True for d in data),
                test_pass_recorded=sum(d.get("pass_tests") is True for d in data),
                test_policy="skipped in partner config" if project == "openssl" else "enabled in partner config",
                verified=verified,
                infrastructure_or_pipeline_errors=sum("python_error_msg" in d for d in data),
                status="validation records available" if data else "NOT VALIDATED"))
    return rows


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("run", type=Path)
    args = ap.parse_args()
    rows = summarize(args.run)
    (args.run / "summary.json").write_text(json.dumps(rows, indent=2))
    print(json.dumps(rows, indent=2))
