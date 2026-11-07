"""Focused checks of experimental integrity; no network or model calls."""
import importlib.util
import json
import os
import shutil
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import generate_variants_codex as bridge
import summarize_run
import prepare_pipeline
import archive_run
import progress


class IntegrityTests(unittest.TestCase):
    def test_codex_discovery_without_app_path(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            binary = tmp/'AppData/Local/OpenAI/Codex/bin/app-version/codex.exe'
            binary.parent.mkdir(parents=True)
            binary.touch()
            self.assertEqual(bridge.find_codex(lookup=lambda _: None, environ={}, user_home=tmp), str(binary))

    def test_exact_partner_prompt_parity_all_conditions(self):
        code = (bridge.ROOT / "functions/alsa-lib/0_alaw_to_s16.c").read_text()
        for condition in bridge.partner.CONDITIONS:
            template = bridge.partner.load_template(condition)
            prompt = bridge.partner.build_prompt(template, code)
            self.assertIn(code, prompt)
            self.assertNotIn("<NUMBER>", prompt)
            self.assertNotIn("<REFERENCE FUNCTION>", prompt)
            self.assertEqual(prompt, template.replace("<NUMBER>", "10").replace("<REFERENCE FUNCTION>", code))

    def test_saved_pilot_is_immutable_and_has_ten_variants(self):
        run = HERE / "runs/corey-pilot-baseline"
        reply = (run / "replies/alsa-lib/0_alaw_to_s16.txt").read_text()
        meta = json.loads((run / "replies/alsa-lib/0_alaw_to_s16.meta.json").read_text())
        prompt = (run / "prompts/alsa-lib/0_alaw_to_s16.txt").read_text()
        self.assertEqual(meta["reply_sha256"], bridge.sha(reply))
        self.assertEqual(meta["prompt_sha256"], bridge.sha(prompt))
        info = json.loads((bridge.ROOT / "functions/alsa-lib/functions_info.json").read_text())[0]
        self.assertEqual(bridge.partner.galapagos_split_check(bridge.partner.parse_response(reply), info["return"]), (10, None))
        self.assertEqual((run / "variants/alsa-lib/0_alaw_to_s16.c.variants").read_text(), bridge.partner.parse_response(reply))

    def test_missing_validation_is_not_a_pass(self):
        with tempfile.TemporaryDirectory() as tmp:
            run = Path(tmp)
            (run / "generation.json").write_text(json.dumps({"selection": {"alsa-lib": ["alaw_to_s16"]}}))
            row = summarize_run.summarize(run)[0]
            self.assertEqual(row["status"], "NOT VALIDATED")
            self.assertIsNone(row["compiled_in_isolation"])
            self.assertEqual(row["validation_records"], 0)

    def test_skipped_openssl_tests_are_labeled(self):
        with tempfile.TemporaryDirectory() as tmp:
            run = Path(tmp)
            (run / "generation.json").write_text(json.dumps({"selection": {"openssl": ["icbrt64"]}}))
            folder = run / "results/openssl/c/0_icbrt64"
            folder.mkdir(parents=True)
            (folder / "v.result.json").write_text(json.dumps({"compiled": True, "pass_tests": True,
                "test_result": "testing disabled", "verification": {"file.bc": {"correct transformations": 1}}}))
            row = summarize_run.summarize(run)[0]
            self.assertEqual(row["verified"], 1)
            self.assertEqual(row["test_policy"], "skipped in partner config")

    def test_command_uses_explicit_settings(self):
        cmd = bridge.command("codex", "requested-model", "medium", Path("neutral.txt"), Path("last.txt"))
        self.assertIn("--ignore-user-config", cmd)
        self.assertIn("--ephemeral", cmd)
        self.assertIn("features.shell_tool=false", cmd)
        self.assertIn('web_search="disabled"', cmd)
        self.assertEqual(cmd[cmd.index("--model") + 1], "requested-model")

    def test_archive_preserves_and_refuses_overwrite(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            workspace, run = tmp/'workspace', tmp/'run'
            source = workspace/'functions/alsa-lib/variants/c/2_add_0.c'
            source.parent.mkdir(parents=True)
            run.mkdir()
            source.write_text('original evidence')
            archive_run.archive(workspace, run, ['alsa-lib'], True)
            saved = run/'galapagos/functions/alsa-lib/variants/c/2_add_0.c'
            self.assertEqual(saved.read_text(), 'original evidence')
            self.assertTrue(source.exists())
            source.write_text('different evidence')
            with self.assertRaises(FileExistsError):
                archive_run.archive(workspace, run, ['alsa-lib'], True)
            self.assertEqual(saved.read_text(), 'original evidence')

    def test_live_monitor_reads_events_and_records_exit(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            scripts, run = tmp/'workspace/scripts', tmp/'run'
            scripts.mkdir(parents=True)
            run.mkdir()
            code = 'import json; print("GALAPAGOS_PROGRESS " + json.dumps({"project":"alsa-lib","function":"add","variant":0,"action":"test_suite"}), flush=True)'
            rc = progress.run_stage([sys.executable, '-c', code], scripts, run/'stage.log', run,
                                    'test stage', 10, poll_interval=0.05)
            state = json.loads((run/'progress.json').read_text())
            self.assertEqual(rc, 0)
            self.assertEqual(state['active']['action'], 'test_suite')
            self.assertEqual(state['state'], 'stage_finished')
            self.assertEqual(state['expected_variants'], 10)
            self.assertIn('test_suite', (run/'progress-events.jsonl').read_text())

    def test_stale_monitor_warning_is_visible(self):
        text = progress.render(dict(state='running', stage='verify', heartbeat_at='2020-01-01T00:00:00+00:00'))
        self.assertIn('monitor has not updated', text)

    def test_saved_pilot_counts_match_partner_counter(self):
        spec = importlib.util.spec_from_file_location('partner_counter', bridge.ROOT/'replication/claude/count_results.py')
        counter = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(counter)
        run = HERE/'runs/corey-pilot-baseline'
        expected = counter.count_function(str(run/'isolation/alsa-lib'), str(run/'results/alsa-lib/c'), '0_alaw_to_s16')
        actual = summarize_run.summarize(run)[0]
        self.assertEqual([actual[k] for k in ('compiled_in_isolation','compiled_in_project','test_pass_recorded','verified')],
                         [expected[k] for k in ('comp_isol','comp_proj','test','verif')])

    @unittest.skipIf(os.name == "nt", "Linux workspace uses symlinks")
    def test_subset_keeps_original_indices_and_isolates_builds(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            base, run = tmp / "base", tmp / "run"
            for folder in ("scripts/tests", "scripts/usecases", "scripts/verifier/alive/build",
                           "linker/build", "functions/alsa-lib", "use_cases/alsa-lib"):
                (base / folder).mkdir(parents=True, exist_ok=True)
            for filename in ("scripts/split_variants.py", "scripts/template_variants.py", "scripts/compile_variants.py",
                             "scripts/generate_variants.py", "scripts/tests/usecase.py", "scripts/usecases/case.py",
                             "functions/template.c", "functions/alsa-lib/functions_info.json", "functions/alsa-lib/2_add.c"):
                shutil.copy2(bridge.ROOT / filename, base / filename)
            for filename in ("scripts/verifier/alive/build/alive-tv", "linker/build/linker", "use_cases/alsa-lib/.git"):
                (base / filename).touch()
            variants = run / "variants/alsa-lib"
            variants.mkdir(parents=True)
            (variants / "2_add.c.variants").write_text("saved variant body")
            (run / "generation.json").write_text(json.dumps({"selection": {"alsa-lib": ["add"]}}))
            argv = ["prepare_pipeline", "--base", str(base), "--run-dir", str(run)]
            with patch.object(sys, "argv", argv), patch.object(Path, "home", return_value=tmp), \
                 patch.object(prepare_pipeline.shutil, "which", return_value="mock-tool"):
                prepare_pipeline.main()
            dest = tmp / "galapagos-corey-runs" / "run"
            self.assertEqual((dest / "functions/alsa-lib/variants/c/2_add.c.variants").read_text(), "saved variant body")
            self.assertEqual(json.loads((dest / "functions/alsa-lib/functions_info.json").read_text())[2]["name"], "add")
            for name in ("split_variants.py", "template_variants.py", "compile_variants.py", "tests/usecase.py", "usecases/case.py"):
                text = (dest / "scripts" / name).read_text()
                compile(text, name, "exec")
            self.assertIn("'alsa-lib': [2]", (dest / "scripts/split_variants.py").read_text())
            self.assertIn("asyncio.Semaphore(2)", (dest / "scripts/tests/usecase.py").read_text())
            self.assertIn(str(dest / "build-copies"), (dest / "scripts/usecases/case.py").read_text())


if __name__ == "__main__":
    unittest.main()
