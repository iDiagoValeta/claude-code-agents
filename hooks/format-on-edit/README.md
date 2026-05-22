# format-on-edit

A `PostToolUse` hook that formats the file Claude just edited with Prettier and,
for JS/TS files, applies `eslint --fix`. It keeps generated code consistent with
your project style without you asking each time.

It **no-ops safely** when the tools are not installed: it prefers the binaries in
the project's `node_modules/.bin` and falls back to globally installed ones, and
it never blocks Claude (always exits `0`).

## Install

1. Copy the script and make it executable:

   ```bash
   mkdir -p .claude/hooks
   cp hooks/format-on-edit/format-on-edit.sh .claude/hooks/
   chmod +x .claude/hooks/format-on-edit.sh
   ```

2. Merge `settings.snippet.json` into `.claude/settings.json` under `hooks`
   (append to an existing `PostToolUse` array if you have one).

3. Restart Claude Code (or run `/doctor`).

## Customize

- Edit the `case` lists in the script to add or remove file extensions.
- Using pnpm/yarn workspaces? The local `node_modules/.bin` lookup already covers
  the common case; point `repo_root` at the right workspace if needed.
- To format only TypeScript, narrow the first `case` to `*.ts|*.tsx`.
