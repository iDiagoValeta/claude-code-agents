#!/usr/bin/env bash
# PreToolUse hook: block edits to sensitive files and block Bash commands that
# would stage/commit them. A guardrail against accidentally writing or committing
# secrets — not a guarantee. Returns a deny decision when a match is found.
set -uo pipefail

input="$(cat)"

extract() {
  printf '%s' "$input" \
    | grep -oE "\"$1\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" \
    | head -n1 \
    | sed -E "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"([^\"]*)\".*/\1/"
}

deny() {
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"%s"}}\n' "$1"
  exit 0
}

tool_name="$(extract tool_name)"

is_sensitive_name() {
  case "$1" in
    .env|.env.*|*.pem|*.key|*.p12|*.pfx|id_rsa|id_dsa|id_ecdsa|id_ed25519|*.keystore|*.jks) return 0 ;;
    credentials|credentials.*|*credentials*|*secret*|*.secrets) return 0 ;;
    *) return 1 ;;
  esac
}

case "$tool_name" in
  Edit|Write)
    file_path="$(extract file_path)"
    [[ -z "$file_path" ]] && exit 0
    if is_sensitive_name "$(basename "$file_path")"; then
      deny "Editing a sensitive file ($(basename "$file_path")) is blocked by policy. Put secrets in an ignored local file and reference them via environment variables."
    fi
    ;;
  Bash)
    command="$(extract command)"
    [[ -z "$command" ]] && exit 0
    # Block staging/committing obvious secret files.
    if printf '%s' "$command" | grep -qE 'git +(add|commit)' \
       && printf '%s' "$command" | grep -qiE '\.env|\.pem|\.key|id_rsa|credentials|secret'; then
      deny "This git command appears to stage or commit a sensitive file (.env/.pem/.key/credentials/secret). Blocked by policy — add it to .gitignore instead."
    fi
    ;;
esac

exit 0
