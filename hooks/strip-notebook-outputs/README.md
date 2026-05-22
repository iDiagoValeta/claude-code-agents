# strip-notebook-outputs

A `PostToolUse` hook that strips cell outputs from Jupyter notebooks whenever
Claude edits a `.ipynb` file.

Keeping outputs in notebooks inflates repository size (embedded images, HTML
tables, full DataFrame prints) and produces noisy diffs where a one-line code
change regenerates hundreds of lines of output. This hook solves that
automatically after every edit.

It **no-ops safely**: it prefers `nbstripout` if installed, falls back to a
pure-Python one-liner that requires no third-party packages, and always
exits `0` so it never blocks Claude.

## Install

1. Copy the script and make it executable:

   ```bash
   mkdir -p .claude/hooks
   cp hooks/strip-notebook-outputs/strip-notebook-outputs.sh .claude/hooks/
   chmod +x .claude/hooks/strip-notebook-outputs.sh
   ```

2. Merge `settings.snippet.json` into `.claude/settings.json` under `hooks`
   (append to an existing `PostToolUse` array if you already have one).

3. Restart Claude Code (or run `/doctor`).

## Optional: install nbstripout

```bash
pip install nbstripout
```

Without it the hook falls back to the Python one-liner, which produces the same
result but does not handle some edge cases (e.g., raw-cell outputs).

## Customize

- To strip outputs only in specific directories, add a path prefix check before
  the `case` block in the script.
- To also strip outputs at commit time (not just on edit), configure `nbstripout`
  as a git filter: `nbstripout --install`.
