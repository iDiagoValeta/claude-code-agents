#!/usr/bin/env bash
# PostToolUse hook: strip cell outputs from Jupyter notebooks after Claude edits them.
# Prevents large binary blobs (embedded images, HTML tables, DataFrames) from
# accumulating in git and causing noisy diffs.
# Prefers nbstripout if installed; falls back to a pure-Python one-liner.
# Always exits 0 so it never blocks Claude.
set -uo pipefail

input="$(cat)"

file_path="$(printf '%s' "$input" \
  | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' \
  | head -n1 \
  | sed -E 's/.*"file_path"[[:space:]]*:[[:space:]]*"([^"]*)".*/\1/')"

# Only act on .ipynb files.
case "$file_path" in
  *.ipynb) ;;
  *) exit 0 ;;
esac

[[ ! -f "$file_path" ]] && exit 0

# Use nbstripout if available (preferred — handles all edge cases).
if command -v nbstripout >/dev/null 2>&1; then
  nbstripout "$file_path" >/dev/null 2>&1 || true
  exit 0
fi

# Fallback: Python one-liner that strips outputs and resets execution counts.
python3 - "$file_path" <<'PYEOF' 2>/dev/null || true
import sys, json, pathlib

path = pathlib.Path(sys.argv[1])
try:
    nb = json.loads(path.read_text(encoding="utf-8"))
except Exception:
    sys.exit(0)

changed = False
for cell in nb.get("cells", []):
    if cell.get("cell_type") == "code":
        if cell.get("outputs") or cell.get("execution_count") is not None:
            cell["outputs"] = []
            cell["execution_count"] = None
            changed = True

if changed:
    path.write_text(json.dumps(nb, indent=1, ensure_ascii=False), encoding="utf-8")
PYEOF

exit 0
