"""Local executable/login check only: no prompts, inference, or validation."""
import os
import subprocess
from generate_variants_codex import find_codex

exe = find_codex(lookup=lambda _: None)  # Deliberately test the normal-terminal fallback.
if not exe:
    raise SystemExit('Desktop Codex executable was not found')
print('Desktop executable:', exe, flush=True)
env = dict(os.environ)
for key in ('OPENAI_API_KEY', 'CODEX_API_KEY', 'OPENAI_BASE_URL'):
    env.pop(key, None)
for args in (['--version'], ['login', 'status']):
    result = subprocess.run([exe, *args], env=env, capture_output=True, text=True, timeout=30)
    print(result.stdout.strip(), flush=True)
    if args == ['login', 'status']:
        if 'ChatGPT' in result.stdout + result.stderr:
            print('Existing ChatGPT login found.', flush=True)
        else:
            raise SystemExit('ChatGPT login not confirmed; sign in with the discovered executable before generating')
    if result.returncode:
        raise SystemExit('CLI check failed: ' + result.stderr)
print('Preflight passed. No experiment or model request was started.')
