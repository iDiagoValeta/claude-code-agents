# Claude Code Instructions

This repository is a source library for creating and maintaining Claude Code agents, skills, and hooks.

General rules for every element:

- Keep each element focused on one necessary, differentiated task.
- Update `README.md` when adding, renaming, or removing an element.
- Do not add copied source citations, raw research links, or bibliography blocks to prompts. Convert reference material into operational instructions.

When adding or changing agents:

- Follow `docs/agent-authoring-guide.md`.
- Store agents in `agents/` as Markdown files with YAML frontmatter.
- Validate that every agent in `agents/` is documented in `README.md` (the `validate-agents` skill checks this).

When adding or changing skills:

- Follow `docs/skill-authoring-guide.md`.
- Store skills in `skills/<name>/` with `SKILL.md` as the entrypoint and any helpers in `templates/` or `scripts/`.
- Set `disable-model-invocation: true` for skills that create or edit files.

When adding or changing hooks:

- Follow `docs/hook-authoring-guide.md`.
- Store each hook in `hooks/<name>/` with its script(s), a `settings.snippet.json`, and a `README.md`.
- Hooks must fail safe: formatters no-op when tools are missing; guardrails deny narrowly and explain why.
