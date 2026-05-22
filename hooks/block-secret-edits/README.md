# block-secret-edits

A `PreToolUse` guardrail that denies edits to sensitive files (`.env`, `*.pem`,
`*.key`, `credentials*`, private keys, keystores) and blocks Bash `git add` /
`git commit` commands that appear to stage or commit those files.

This is a **safety net, not a guarantee**. It uses filename patterns and simple
command matching; it will not catch every way a secret can leak. Keep using
`.gitignore`, secret scanning, and review.

## Install

1. Copy the script and make it executable:

   ```bash
   mkdir -p .claude/hooks
   cp hooks/block-secret-edits/block-secret-edits.sh .claude/hooks/
   chmod +x .claude/hooks/block-secret-edits.sh
   ```

2. Merge `settings.snippet.json` into `.claude/settings.json` under `hooks`
   (append to an existing `PreToolUse` array if you have one).

3. Restart Claude Code (or run `/doctor`).

## How it works

- On `Edit`/`Write`, it reads `tool_input.file_path` and denies the action if the
  filename matches a sensitive pattern.
- On `Bash`, it denies commands that combine `git add`/`git commit` with a
  reference to a secret-looking file.
- A denial returns a `permissionDecision: "deny"` with a reason, which Claude
  sees and can route around (e.g. by adding the file to `.gitignore`).

## Customize

Edit the `is_sensitive_name` patterns and the Bash grep in the script to match
your project's conventions (for example, additional config or certificate paths).
