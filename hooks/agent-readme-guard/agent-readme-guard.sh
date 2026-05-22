#!/usr/bin/env bash
# PostToolUse hook: when an agents/*.md file is edited, remind to update README.md.
# Enforces the repo's CLAUDE.md rule that every agent must be documented in README.
# Non-blocking: emits a systemMessage reminder and always exits 0.
set -uo pipefail

input="$(cat)"

file_path="$(printf '%s' "$input" \
  | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' \
  | head -n1 \
  | sed -E 's/.*"file_path"[[:space:]]*:[[:space:]]*"([^"]*)".*/\1/')"

# Only react to agent definition files.
case "$file_path" in
  */agents/*.md|agents/*.md) ;;
  *) exit 0 ;;
esac

repo_root="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null)}"
[[ -z "$repo_root" ]] && exit 0

# If README.md has no pending change in the working tree, nudge the author.
if [[ -z "$(git -C "$repo_root" status --porcelain -- README.md 2>/dev/null)" ]]; then
  agent_base="$(basename "$file_path" .md)"
  printf '{"systemMessage": "Reminder: %s changed but README.md has no pending update. Per CLAUDE.md, document every agent in README.md (table row + ### detail block + repo-structure entry)."}\n' "$agent_base"
fi

exit 0
