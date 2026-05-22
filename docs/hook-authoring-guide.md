# Claude Code Hook Authoring Guide

Last checked against official Anthropic documentation on 2026-05-21.

Official reference:
- [Hooks](https://code.claude.com/docs/en/hooks)

## Hooks vs Skills vs Agents

A **hook** is deterministic automation that runs in response to a Claude Code
event (a tool call, a prompt, session start, etc.). Hooks are configuration plus
shell scripts — not Markdown with frontmatter. Use a hook when you want
something to happen automatically and reliably, regardless of what Claude
decides (formatting on every edit, blocking a forbidden action, injecting
context at session start).

For reusable workflows the user triggers, use a **skill**. For isolated
specialist tasks, use an **agent**.

## Where Hooks Are Configured

Hooks live in settings files, in increasing specificity:

- `~/.claude/settings.json` — all projects.
- `.claude/settings.json` — this project, committed and shared.
- `.claude/settings.local.json` — this project, gitignored (personal).

## Settings Schema

Hooks are grouped by event, then by matcher, then a list of command hooks:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PROJECT_DIR}/.claude/hooks/my-hook.sh",
            "timeout": 600
          }
        ]
      }
    ]
  }
}
```

- `matcher`: tool-name match. Plain names and `|`-separated lists are exact
  (`Edit|Write`); other characters are treated as a regex. Events without a tool
  (e.g. `UserPromptSubmit`, `Stop`) take no matcher.
- `command` hook fields: `type: "command"` (required), `command` (required),
  optional `args`, `timeout` (seconds), `async`, and `if` (a permission-rule
  filter such as `"Edit(*.ts)"`).
- `${CLAUDE_PROJECT_DIR}` resolves to the project root and is exported to the
  script's environment, so paths work from any working directory.

## Events

- `PreToolUse` — before a tool runs; can allow/deny/ask.
- `PostToolUse` — after a tool runs; can feed context back or block follow-up.
- `UserPromptSubmit` — when the user submits a prompt; can add context or block.
- `SessionStart` — at session start; good for injecting standing context.
- `Stop` / `SubagentStop` — when Claude (or a subagent) finishes.
- `Notification`, `PreCompact`, and others — see the docs for the full list.

## Input, Exit Codes, and Decisions

- **Input:** the hook receives JSON on stdin. Common fields include
  `session_id`, `cwd`, and `hook_event_name`. `PreToolUse` adds `tool_name` and
  `tool_input`; `PostToolUse` also includes the tool result.
- **Exit codes:** `0` = success (stdout may carry JSON output); `2` = blocking
  error (stderr is fed back to Claude and the action is blocked where the event
  supports it); any other code is a non-blocking error.
- **Decision control (JSON on stdout):**
  - `PreToolUse`: `hookSpecificOutput.permissionDecision` of
    `allow` | `deny` | `ask`, with `permissionDecisionReason`.
  - `PostToolUse` / `UserPromptSubmit` / `Stop`: top-level `decision: "block"`
    with `reason`.
  - Universal optional fields: `continue`, `stopReason`, `systemMessage`,
    `suppressOutput`.

## Parsing Input Without Extra Tools

The example hooks in this repo parse stdin with `grep`/`sed` so they need no
`jq`. That is fine for simple field extraction; for anything structured, prefer
`jq` or `python3` and guard for their absence.

## How This Library Ships Hooks

Because hooks are config + scripts, each hook in `hooks/<name>/` provides:

- the script(s) to copy into `.claude/hooks/`,
- a `settings.snippet.json` to merge into `.claude/settings.json` (append to an
  existing event array rather than overwriting it),
- a `README.md` with install steps and customization notes.

Make scripts executable (`chmod +x`) after copying.

## Safety

- Hooks run shell commands automatically with your environment's permissions.
  Review any hook before enabling it, especially from an untrusted repository.
- Prefer hooks that fail safe: format/lint hooks should no-op when tools are
  missing and never block; guardrail hooks should deny narrowly and explain why.
- Use `/doctor` to check that hooks are loaded and well-formed.

## Review Checklist for New Hooks

- The event and matcher are the narrowest that achieve the goal.
- The script reads stdin, handles missing fields, and exits with the right code.
- Paths use `${CLAUDE_PROJECT_DIR}`.
- The hook fails safe and explains any denial.
- A `README.md` documents install and customization.
- The `README.md` "Available hooks" section is updated.
- The hook is checked into version control.
