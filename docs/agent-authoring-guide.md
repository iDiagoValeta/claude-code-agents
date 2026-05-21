# Claude Code Agent Authoring Guide

Last checked against official Anthropic documentation on 2026-05-21.

Official references:
- [Create custom subagents](https://code.claude.com/docs/en/sub-agents)
- [How Claude remembers your project](https://code.claude.com/docs/en/memory)
- [Claude Code settings](https://code.claude.com/docs/en/settings)

## When to Add an Agent

Add a Claude Code subagent when the same specialized worker will be useful repeatedly, the task is self-contained, or the work would produce enough search results, logs, or file contents to pollute the main conversation context.

Good fits:
- Code review, test repair, repository mapping, debugging, migration planning, security review.
- Work that should run with narrower tools or permissions than the main session.
- Research tasks that can return a concise summary.

Poor fits:
- One-off prompts that do not need to be reused.
- Tasks that require frequent back-and-forth with the user.
- Work where planning, implementation, and testing must share the same detailed context.
- Reusable workflows that should run in the main conversation context. Use a skill for those instead.

## File Format

Agents are Markdown files with YAML frontmatter. In this repo, keep them in `agents/` and name the file after the `name` field.

```markdown
---
name: example-agent
description: "Use proactively when a user needs a focused example task handled."
tools: Read, Grep, Glob, Bash
model: sonnet
color: blue
memory: project
---

You are a focused specialist for ...
```

Required fields:
- `name`: unique, lowercase, hyphenated identifier.
- `description`: clear natural-language trigger. Claude uses this to decide when to delegate.

Common optional fields:
- `tools`: allowlist of tools. Prefer setting this explicitly. Omitting it inherits all tools from the main session, including MCP tools.
- `model`: use `sonnet` unless the agent has a clear reason to use `haiku`, `opus`, `inherit`, or a full model ID.
- `color`: keep colors distinct and meaningful in this repo.
- `permissionMode`: use `plan` for planning-only agents.
- `memory`: use `project` for shareable project-specific learning, `user` for cross-project personal learning, and `local` for project-specific learning that should not be checked in.

## Frontmatter Conventions

Use this field order unless a field is not needed:

```yaml
---
name: agent-name
description: "Use proactively when ..."
tools: Read, Grep, Glob, Bash
permissionMode: plan
model: sonnet
color: blue
memory: project
---
```

Tool guidance:
- Read-only agents should usually use `Read, Grep, Glob, Bash`.
- Agents that fix code or tests may use `Edit` and `Write`.
- Do not inherit all tools unless broad access is intentional.
- If Bash is included, the prompt must tell the agent how to discover and verify safe commands.
- Memory-enabled agents can maintain their memory. Anthropic documents that memory enables `Read`, `Write`, and `Edit` so the agent can manage memory files. If strict read-only behavior matters, omit `memory` or state that repository files must not be modified.

## Prompt Body Conventions

The body is the agent's system prompt. Keep it specific, structured, and actionable.

Include:
- Role and scope: what the agent is for, and what it is not for.
- Operating principles: constraints, priorities, and decision rules.
- Workflow: the sequence the agent should follow when invoked.
- Tool expectations: what to inspect before acting, and how to verify results.
- Output format: the exact shape expected in the final response.
- Quality checks: a short checklist the agent should satisfy before responding.
- Memory guidance when `memory` is enabled: what may be saved and what must not be saved.

Avoid:
- Generic assistant instructions that duplicate every other agent.
- Multiple unrelated responsibilities in one agent.
- Contradictory rules.
- Unbounded "be flexible" language.
- Stale command lists presented as permanent truth. For fast-changing Claude Code behavior, instruct the agent to verify with `/help`, `claude --help`, `claude agents`, or official docs.

## Description Style

Descriptions should be trigger-oriented, not just role labels.

Prefer:

```yaml
description: "Testing specialist. Use proactively when a user needs to design, write, fix, or improve tests, diagnose flaky tests, or decide what coverage to add after a code change."
```

Avoid:

```yaml
description: "An expert testing agent."
```

Examples in the description are acceptable when they materially improve delegation. Quote the whole description if it contains colons, quotes, or multiline examples.

## Review Checklist for New Agents

Before adding or changing an agent:

- The agent has one clear responsibility.
- `name` is lowercase, hyphenated, unique, and matches the file name.
- `description` says when to use the agent.
- `tools` is explicit and limited to what the job needs.
- `model`, `permissionMode`, and `memory` are deliberate.
- The prompt assumes a fresh, isolated context and tells the agent how to gather missing context.
- The prompt defines output format and quality checks.
- Memory guidance exists when `memory` is enabled.
- The `README.md` entry is updated.
- The agent is checked into version control.
