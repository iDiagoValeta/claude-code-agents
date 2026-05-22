# agent-readme-guard

A `PostToolUse` hook for this library. When Claude edits an `agents/*.md` file,
it checks whether `README.md` has a pending change in the working tree. If not,
it surfaces a reminder to document the agent, enforcing the rule in
`.claude/CLAUDE.md` that every agent must appear in `README.md`.

It is **non-blocking**: it only emits a reminder and always exits `0`.

## Install

1. Copy the script into your project hooks directory and make it executable:

   ```bash
   mkdir -p .claude/hooks
   cp hooks/agent-readme-guard/agent-readme-guard.sh .claude/hooks/
   chmod +x .claude/hooks/agent-readme-guard.sh
   ```

2. Merge `settings.snippet.json` into `.claude/settings.json` under `hooks`.
   If you already have `PostToolUse` hooks, add this entry to the existing array
   rather than overwriting it.

3. Restart Claude Code (or run `/doctor`) so the hook is loaded.

## Notes

- `${CLAUDE_PROJECT_DIR}` resolves to the project root, so the path works
  regardless of the current working directory.
- The hook reads the tool event JSON on stdin and inspects `tool_input.file_path`.
- It is specific to this repository's layout (`agents/` + `README.md`). Adjust
  the path checks if you reuse it elsewhere.
