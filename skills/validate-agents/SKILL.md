---
name: validate-agents
description: "Validate every agent in agents/ has well-formed frontmatter (name matches filename, required name and description present) and is documented in README.md, enforcing the repo's CLAUDE.md rule. Use before committing agent changes."
allowed-tools: Bash(bash *) Read Grep Glob
---

# Validate agents

Run the repository's agent validator and act on the result.

## Report

!`bash ${CLAUDE_SKILL_DIR}/scripts/validate-agents.sh`

## What to do with the report

The report above is the source of truth (it ran against the current files).

- If the result is **all agents valid**, confirm that to the user and stop.
- If any agent **FAILS**, summarize each failure and propose the smallest fix:
  - "not linked in README.md" → add the table row in the **Available agents**
    table (alphabetical) plus the repo-structure tree entry.
  - "no detail section" → add the `### \`name\`` block matching the existing
    format (one-line quote, When to use it, Model + Color, example prompts,
    install command).
  - "name does not match filename" → rename the file or fix the `name` field so
    they agree.
  - "missing required name/description" → add the field following
    `docs/agent-authoring-guide.md`.
- Treat **WARN** lines (missing color, color imbalance) as advisory, not blocking.

Only edit files if the user asks you to apply the fixes. The script itself is
read-only and safe to run anytime, including in CI.
