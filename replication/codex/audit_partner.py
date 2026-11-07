"""Audit saved partner evidence on the agreed first-three-function subset."""
import hashlib
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location('partner_count', ROOT / 'replication/claude/count_results.py')
counter = importlib.util.module_from_spec(spec)
spec.loader.exec_module(counter)


def main():
    lines = ['# Partner snapshot and alignment audit', '',
             'Snapshot: `1188d270` (pulled November 4, 2026). Counts below use only the first three reference functions in each dataset. They describe checked-in evidence, not rerun experiments.', '',
             '| Run | Saved prompts | Saved replies | Subset result records | Compile alone | Compile in project | Tests recorded true | Verified |',
             '|---|---:|---:|---:|---:|---:|---:|---:|']
    details = {}
    for run in sorted((ROOT / 'replication/claude/runs').iterdir()):
        if not run.is_dir():
            continue
        totals = dict.fromkeys(('result_files', 'comp_isol', 'comp_proj', 'test', 'verif'), 0)
        rows = []
        for project in counter.PROJECTS:
            info = json.loads((ROOT / f'functions/{project}/functions_info.json').read_text())[:3]
            for i, fn in enumerate(info):
                fid = f'{i}_{fn["name"]}'
                count = counter.count_function(str(run / f'galapagos/functions/{project}/variants/c'),
                                                str(run / f'galapagos/out/{project}/c'), fid)
                rows.append(dict(project=project, function=fn['name'], **count))
                for key in totals:
                    totals[key] += count[key]
        prompts = len(list(run.glob('prompts/*/*.txt')))
        replies = len([p for p in run.glob('replies/*/*.txt') if '.attempt' not in p.name and not p.name.endswith('.stderr.txt')])
        lines.append(f'| {run.name} | {prompts} | {replies} | ' + ' | '.join(str(totals[k]) for k in totals) + ' |')
        manifest = run / 'generation.json'
        settings = json.loads(manifest.read_text()) if manifest.exists() else {}
        condition = settings.get('condition')
        template = ROOT / f'replication/claude/prompts/{condition}.txt'
        current_hash = hashlib.sha256(template.read_text().rstrip('\n').encode()).hexdigest() if template.exists() else None
        details[run.name] = dict(subset_counts=rows, settings=settings,
                                 manifest_matches_current_template=settings.get('prompt_template_sha256') == current_hash)
    lines += ['', 'Missing records do not establish a measured failure. The original baseline and pilot can contain replies for five functions per library; only their first-three subset is counted above. OpenSSL test flags represent skipped tests in the configured pipeline, not observed test executions.', '',
              '## Alignment changes', '',
              '- Current metadata now explicitly selects the first three functions per dataset.',
              '- OpenSSL enables `-no-asm`, so keccak1600.c produces the required compiler artifacts.',
              '- The libgcrypt submodule revision changed to `005292cf...`, following the upstream README workaround.',
              '- `cot` and `context_cot` now request short approach/equivalence comments. Older stronger prompt versions are retained under `prompts/blocked-v1` and `blocked-v2`. Do not combine results from different prompt versions without labeling them.',
              '- `count_results.py` counts the same four stages as the upstream table and now covers all six libraries. Our summary uses the same positive-count rule, adds missing-result labels and skipped-test policy, and filters to each run selection.',
              '- Our baseline pilot remains unchanged and labeled as a one-function preliminary run, not a full repetition of the reduced study.', '',
              '## Result retention and progress', '',
              'Lincoln moves shared live folders into each run archive. Our runs use an independent workspace from the start, then copy outputs to their own `galapagos/` archive. Existing different evidence is never overwritten. Both layouts retain the scientific results; our layout also prevents stale build copies from crossing conditions.', '',
              'The live viewer shows the stage, active function/variant, completed result records, elapsed time, CPU/disk/log activity, and a possible-stall warning after ten minutes without observed work. A separate stale-heartbeat warning detects a monitor that stopped updating. These are warnings, not proof of a hang. Monitoring does not change compiler, test, or verification options.', '',
              'Detailed per-function counts, saved generation settings, and template-hash comparisons are in `partner-audit.json`. No experiments were launched by this audit.']
    (ROOT / 'PARTNER_ALIGNMENT.md').write_text('\n'.join(lines), encoding='utf-8')
    (ROOT / 'replication/codex/partner-audit.json').write_text(json.dumps(details, indent=2), encoding='utf-8')
    print('\n'.join(lines[:18]))


if __name__ == '__main__':
    main()
