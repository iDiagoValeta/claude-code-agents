# Claude Code Skill Authoring Guide

Last checked against official Anthropic documentation on 2026-05-21.

Official reference:
- [Agent Skills](https://code.claude.com/docs/en/skills)

## Skill vs Agent

Use a **skill** for a reusable workflow that should run in the **main
conversation context** — the user (or Claude) invokes it, and it operates with
the session's full context and history.

Use an **agent** for a self-contained task that benefits from an **isolated
context** and a narrower tool set (see `agent-authoring-guide.md`). Heavy
research or work that would flood the conversation with logs is a good agent.

Rule of thumb: if the work needs the ongoing conversation, it is a skill; if it
can take a brief and return a summary, it is an agent.

## File Format

A skill is a directory whose entrypoint is `SKILL.md` (Markdown with YAML
frontmatter). In this repo, store skills under `skills/<skill-name>/` so a user
can copy the whole directory.

```
skills/
  my-skill/
    SKILL.md           # required entrypoint
    templates/         # optional supporting files
    scripts/           # optional helper scripts
```

Users install a skill by copying its directory:

```bash
# Available globally (all projects)
cp -r skills/my-skill ~/.claude/skills/

# Available only for the current project
cp -r skills/my-skill .claude/skills/
```

The directory name becomes the `/command` name.

## Frontmatter

All fields are optional, but `description` is strongly recommended.

```yaml
---
name: my-skill
description: "What it does and when to use it. Put the primary use case first."
argument-hint: "[arg]"
disable-model-invocation: true
allowed-tools: Read Grep Glob
---
```

- `name`: display name; lowercase letters, numbers, and hyphens; max 64 chars.
  Defaults to the directory name.
- `description`: what the skill does and when to use it. Lead with the main use
  case. The combined `description` (+ `when_to_use`) is truncated near 1,536
  characters, so keep it tight.
- `when_to_use`: optional extra trigger phrasing.
- `argument-hint`: autocomplete hint shown after the command, e.g. `[agent-name]`.
- `disable-model-invocation: true`: only the user can invoke it. Use this for
  side-effecting workflows (anything that creates or edits files).
- `user-invocable: false`: only Claude can invoke it (background knowledge).
- `allowed-tools`: pre-approved tools, as a space-separated string or YAML list.
  Scope them tightly, e.g. `Bash(git *) Read Edit`.
- Other fields exist (`model`, `effort`, `context: fork`, `agent`, `hooks`,
  `paths`). Add them deliberately and verify current behavior in the docs.

## Dynamic Context and Substitutions

- `` !`<command>` `` at the start of a line runs the command before Claude reads
  the skill and inlines the output. Use a fenced ` ```! ` block for multi-line.
  Prefer this for grounding the skill in real state (git status, file lists).
- `${CLAUDE_SKILL_DIR}` resolves to the skill's own directory — use it to
  reference bundled `templates/` and `scripts/`.
- Argument substitutions: `$ARGUMENTS`, `$1`, `$2`, `$name`. Also
  `${CLAUDE_SESSION_ID}`.

## Body Conventions

The body is standing instructions for the workflow. Keep it specific and
actionable:

- State the goal and any preconditions (validate arguments early).
- Use numbered steps for multi-stage workflows.
- Reference supporting files via `${CLAUDE_SKILL_DIR}` instead of duplicating
  their content.
- Define the expected output.
- Keep `SKILL.md` focused (roughly under 500 lines); move detail into supporting
  files the skill loads on demand.

Avoid (consistent with `.claude/CLAUDE.md`):
- Raw research links, citations, or bibliography blocks. Convert reference
  material into operational instructions.
- Side effects in a skill that is model-invocable. If it creates or edits files,
  set `disable-model-invocation: true`.

## Review Checklist for New Skills

- The skill has one clear, reusable purpose that belongs in the main context.
- `description` says what it does and when to use it, primary case first.
- `allowed-tools` is explicit and minimal.
- Side-effecting skills set `disable-model-invocation: true`.
- Supporting files are referenced with `${CLAUDE_SKILL_DIR}`.
- The `README.md` "Available skills" section is updated.
- The skill is checked into version control.
