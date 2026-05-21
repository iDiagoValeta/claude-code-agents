# Claude Code Instructions

This repository is a source library for creating and maintaining Claude Code agents.

When adding or changing agents:

- Follow `docs/agent-authoring-guide.md`.
- Keep each agent focused on one necessary, differentiated task.
- Store reusable agents in `agents/` as Markdown files with YAML frontmatter.
- Update `README.md` when adding, renaming, or removing an agent.
- Do not add copied source citations, raw research links, or bibliography blocks to agent prompts.
- Convert reference material into operational instructions.
- Validate that every agent in `agents/` is documented in `README.md`.
