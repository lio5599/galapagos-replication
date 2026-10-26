# Variant generation (the GPT-4o API call) has been removed: variants are
# produced by hand in a chat. The original file is kept as
# functions/generate_variants.py.original.
#
# Other scripts do `from generate_variants import WORKSPACE`, so this file
# stays. It is also the ONE place that says where variants are read from and
# where results are written:
#
#   GALAPAGOS_VARIANTS  folder laid out as <project>/<lang>/   e.g. .../ffmpeg/c/1_mix_0.c.raw
#   GALAPAGOS_RESULTS   folder laid out as <project>/<lang>/<function>/   (result JSONs)
#
# Both are required, so nothing silently falls back to another folder.
import os
import sys

WORKSPACE = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
DIRNAME = os.path.abspath(os.path.dirname(__file__))


def _required(var):
    value = os.environ.get(var)
    if not value:
        sys.exit(f"Set {var} before running this script (see scripts/generate_variants.py).")
    return os.path.abspath(os.path.expanduser(value))


def variants_dir(project, lang):
    d = os.path.join(_required("GALAPAGOS_VARIANTS"), project, lang)
    os.makedirs(d, exist_ok=True)
    return d


def results_dir(project, lang):
    d = os.path.join(_required("GALAPAGOS_RESULTS"), project, lang)
    os.makedirs(d, exist_ok=True)
    return d
