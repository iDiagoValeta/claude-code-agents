#!/usr/bin/env bash
# Validate that every agent in agents/ has well-formed frontmatter and is
# documented in README.md, enforcing the repo's CLAUDE.md rule.
# Read-only. Exits non-zero if any agent fails a hard check (CI-friendly).
set -uo pipefail

repo_root="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
agents_dir="$repo_root/agents"
readme="$repo_root/README.md"

fail=0
warn=0

if [[ ! -d "$agents_dir" ]]; then
  echo "FAIL: agents/ directory not found at $agents_dir"
  exit 1
fi
if [[ ! -f "$readme" ]]; then
  echo "FAIL: README.md not found at $readme"
  exit 1
fi

# Extract a top-level frontmatter scalar (first occurrence) from a file.
frontmatter_value() {
  local file="$1" key="$2"
  awk -v k="$key" '
    NR==1 && $0=="---" { inblock=1; next }
    inblock && $0=="---" { exit }
    inblock {
      if ($0 ~ "^" k ":") {
        sub("^" k ":[[:space:]]*", "")
        gsub(/^"|"$/, "")
        print
        exit
      }
    }
  ' "$file"
}

shopt -s nullglob
agent_files=("$agents_dir"/*.md)
shopt -u nullglob

if [[ ${#agent_files[@]} -eq 0 ]]; then
  echo "FAIL: no agent files found in agents/"
  exit 1
fi

echo "Validating ${#agent_files[@]} agent file(s) in agents/"
echo

declare -A color_count

for file in "${agent_files[@]}"; do
  base="$(basename "$file" .md)"
  problems=()

  # Frontmatter must open on line 1.
  if [[ "$(head -n1 "$file")" != "---" ]]; then
    problems+=("missing YAML frontmatter (file must start with '---')")
  fi

  name="$(frontmatter_value "$file" name)"
  desc="$(frontmatter_value "$file" description)"
  color="$(frontmatter_value "$file" color)"

  [[ -z "$name" ]] && problems+=("missing required 'name'")
  [[ -z "$desc" ]] && problems+=("missing required 'description'")

  if [[ -n "$name" && "$name" != "$base" ]]; then
    problems+=("name '$name' does not match filename '$base'")
  fi
  if [[ -n "$name" && ! "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    problems+=("name '$name' is not lowercase-hyphenated")
  fi

  # README documentation: table link + detail heading.
  if ! grep -qF "agents/$base.md" "$readme"; then
    problems+=("not linked in README.md (expected a reference to agents/$base.md)")
  fi
  if ! grep -qF "### \`$base\`" "$readme"; then
    problems+=("no '### \`$base\`' detail section in README.md")
  fi

  # Color is recommended; track distribution as a warning only.
  if [[ -z "$color" ]]; then
    echo "WARN  $base: no 'color' set"
    warn=$((warn+1))
  else
    color_count["$color"]=$(( ${color_count["$color"]:-0} + 1 ))
  fi

  if [[ ${#problems[@]} -eq 0 ]]; then
    echo "PASS  $base"
  else
    fail=$((fail+1))
    echo "FAIL  $base"
    for p in "${problems[@]}"; do
      echo "        - $p"
    done
  fi
done

echo
echo "Color distribution (reuse is allowed; aim for balance):"
for c in "${!color_count[@]}"; do
  echo "  $c: ${color_count[$c]}"
done | sort

echo
if [[ $fail -gt 0 ]]; then
  echo "RESULT: $fail agent(s) failed, $warn warning(s)."
  exit 1
fi
echo "RESULT: all agents valid, $warn warning(s)."
exit 0
