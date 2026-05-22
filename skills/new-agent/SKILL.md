---
name: new-agent
description: "Scaffold a new Claude Code subagent in this library following docs/agent-authoring-guide.md, then register it in README.md. Use when adding a new agent to this repo."
argument-hint: "[agent-name]"
disable-model-invocation: true
allowed-tools: Read Glob Grep Write Edit Bash
---

# Scaffold a new agent

You are creating a new agent in this library and registering it in `README.md`,
strictly following the repository's authoring conventions. This skill has side
effects (it creates and edits files), so it is user-invoked only.

The requested agent name is: **$0** (lowercase, hyphenated). If it is missing or
not lowercase-hyphenated, ask the user for a valid name before proceeding.

## Reference material (read first)

- Authoring rules: read `docs/agent-authoring-guide.md`.
- Canonical example: read `agents/code-reviewer.md` for body structure and the
  trigger-oriented `description` style with `<example>` blocks.
- Template: `${CLAUDE_SKILL_DIR}/templates/agent-template.md`.

## Colors already in use

!`grep -h '^color:' agents/*.md | sort | uniq -c | sort -rn`

Pick a `color` that is meaningful for the new agent's domain. Prefer one of the
least-used colors above. Valid values are the standard Claude Code colors:
red, blue, green, yellow, purple, orange, pink, cyan.

## Steps

1. Confirm the agent has ONE clear responsibility. If the request bundles
   multiple concerns, propose splitting before scaffolding.
2. Copy `${CLAUDE_SKILL_DIR}/templates/agent-template.md` into `agents/$0.md`.
3. Fill in the frontmatter in the required field order
   (`name`, `description`, `tools`, `permissionMode`, `model`, `color`, `memory`),
   omitting fields the agent does not need:
   - `name` must equal `$0` and match the filename.
   - `description` must be trigger-oriented ("Use proactively when ...") with
     2-4 realistic `<example>` blocks. Quote the whole string.
   - `tools`: read-only agents use `Read, Grep, Glob, Bash`; agents that change
     files add `Edit, Write`. Do not inherit all tools.
   - `model: sonnet` unless there is a clear reason otherwise.
   - Include `memory` only if the agent benefits from durable project learning;
     if so, keep the MEMORY GUIDANCE section, otherwise delete it.
4. Write the prompt body: role/scope, the isolated-context paragraph, CORE
   MISSION, OPERATING PRINCIPLES, WORKFLOW, WHAT TO INSPECT, RESPONSE FORMAT,
   QUALITY CHECKS (and MEMORY GUIDANCE only if `memory` is set). Convert any
   reference material into operational instructions — do not paste links,
   citations, or bibliography blocks.
5. Update `README.md`:
   - Add a row to the **Available agents** table (keep alphabetical order),
     linking to `./agents/$0.md`.
   - Add a `### \`$0\`` detail block matching the existing format: a one-line
     quote, "When to use it", "Model" + "Color", 3-4 example prompts, and an
     install command (`cp agents/$0.md ~/.claude/agents/`).
   - Add the new file to the **Repo structure** tree.
6. Run the authoring-guide review checklist against the new agent and report any
   item that is not satisfied.

## Output

Report the created file path, the chosen color and tools (with a one-line
justification), and confirm the README table row, detail block, and repo-tree
entry were added. List any review-checklist items that still need attention.
