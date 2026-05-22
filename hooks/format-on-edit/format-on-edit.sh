#!/usr/bin/env bash
# PostToolUse hook: format (and optionally lint-fix) the file Claude just edited.
# No-ops safely when the formatter/linter is not installed, so it is safe to
# enable in any repo. Always exits 0; formatting failures never block Claude.
set -uo pipefail

input="$(cat)"

file_path="$(printf '%s' "$input" \
  | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' \
  | head -n1 \
  | sed -E 's/.*"file_path"[[:space:]]*:[[:space:]]*"([^"]*)".*/\1/')"

[[ -z "$file_path" || ! -f "$file_path" ]] && exit 0

# Only format file types we recognize.
case "$file_path" in
  *.ts|*.tsx|*.js|*.jsx|*.mjs|*.cjs|*.json|*.css|*.scss|*.less|*.html|*.md|*.yaml|*.yml) ;;
  *) exit 0 ;;
esac

repo_root="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"

# Run a tool from the project's local node_modules first, then a global one.
run_tool() {
  local bin="$1"; shift
  if [[ -x "$repo_root/node_modules/.bin/$bin" ]]; then
    "$repo_root/node_modules/.bin/$bin" "$@"
  elif command -v "$bin" >/dev/null 2>&1; then
    "$bin" "$@"
  fi
}

run_tool prettier --write "$file_path" >/dev/null 2>&1 || true

case "$file_path" in
  *.ts|*.tsx|*.js|*.jsx|*.mjs|*.cjs)
    run_tool eslint --fix "$file_path" >/dev/null 2>&1 || true
    ;;
esac

exit 0
