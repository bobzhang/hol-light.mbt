"""Exercise scheduling and timing reports without compiling HOL theories."""
import contextlib
import importlib.util
import io
import json
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch


spec = importlib.util.spec_from_file_location("runner", Path(__file__).with_name("test.py"))
runner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(runner)


class RunnerTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.args = SimpleNamespace(build_jobs="1", jobs="1", stack_size="60000",
                                    max_rss_gb="12", times=False)
        for name, value in [("ROOT", str(self.root)), ("ONLY", {}),
                            ("build_lock", contextlib.nullcontext)]:
            p = patch.object(runner, name, value)
            p.start()
            self.addCleanup(p.stop)

    def report(self):
        return json.loads((self.root / "_build/test_wasm-gc_timings.json").read_text())

    def test_long_jobs_start_first_without_reordering_tests_inside_them(self):
        manifests = {
            "light": {"z_test.mbt": [{}], "a_test.mbt": [{}, {}]},
            "heavy": {"02_second_test.mbt": [{}, {}], "01_first_test.mbt": [{}]},
            "medium": {"test.mbt": [{}]},
        }
        for package, files in manifests.items():
            d = self.root / "_build/wasm-gc/debug/test" / package
            d.mkdir(parents=True)
            (d / "__blackbox_test_info.json").write_text(json.dumps({"tests": files}))
            (d / f"{package}.blackbox_test.wasm").touch()
        launched = []

        def launch(cmd, **kwargs):
            args = json.loads(cmd[cmd.index("--test-args") + 1])
            launched.append(args)
            output = "\n".join(json.dumps({"type": "result", "file": f, "index": i,
                                           "message": ""}, separators=(",", ":"))
                               for f, ranges in args["file_and_index"]
                               for r in ranges for i in range(r["start"], r["end"]))
            return SimpleNamespace(pid=1, returncode=0, communicate=lambda: (output, ""))

        built = SimpleNamespace(returncode=0, stdout="", stderr="")
        with patch.object(runner.subprocess, "run", return_value=built), \
             patch.object(runner.subprocess, "Popen", side_effect=launch), \
             patch.object(runner, "weights", return_value={"light": 1, "medium": 10, "heavy": 100}), \
             contextlib.redirect_stdout(io.StringIO()):
            self.assertTrue(runner.run_wasm("wasm-gc", list(manifests), self.args))
        self.assertEqual([x["package"].split("/")[-1] for x in launched],
                         ["heavy", "medium", "light"])
        self.assertEqual(launched[0]["file_and_index"], [
            ["01_first_test.mbt", [{"start": 0, "end": 1}]],
            ["02_second_test.mbt", [{"start": 0, "end": 2}]],
        ])
        self.assertEqual(launched[2]["file_and_index"], [
            ["z_test.mbt", [{"start": 0, "end": 1}]],
            ["a_test.mbt", [{"start": 0, "end": 2}]],
        ])
        report = self.report()
        self.assertEqual(report["target"], "wasm-gc")
        for key in ["build_wait_seconds", "build_seconds", "execution_seconds"]:
            self.assertGreaterEqual(report[key], 0)

    def test_build_failure_records_compile_time_without_claiming_tests_ran(self):
        built = SimpleNamespace(returncode=1, stdout="Error: failed to compile", stderr="")
        with patch.object(runner.subprocess, "run", return_value=built), \
             patch.object(runner.subprocess, "Popen") as launch, \
             patch.object(runner.time, "monotonic", side_effect=[10, 12, 17]), \
             contextlib.redirect_stdout(io.StringIO()):
            self.assertFalse(runner.run_wasm("wasm-gc", ["broken"], self.args))
        launch.assert_not_called()
        self.assertEqual(self.report(), {
            "target": "wasm-gc", "build_wait_seconds": 2,
            "build_seconds": 5, "execution_seconds": None,
        })


if __name__ == "__main__":
    unittest.main()
