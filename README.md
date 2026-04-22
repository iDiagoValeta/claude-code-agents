# Claude Code Agents

A collection of personal agents for [Claude Code](https://claude.ai/code), Anthropic's official CLI.

---

## What is this?

This repository contains custom subagents ready to use with Claude Code. Each agent has a specific purpose and is optimized to respond accurately within its domain.

It also includes an **interactive cheatsheet** covering Claude Code commands, flags, and shortcuts.

---

## How to install agents

Copy the `.md` file of the agent you want into your agents directory:

```bash
# Available globally (all projects)
~/.claude/agents/

# Available only for the current project
.claude/agents/
```

Then restart Claude Code or run `/agents` to verify it is available.

---

## Available agents

### `claude-code-expert`

> Expert on everything related to Claude Code, Anthropic's official agentic CLI.

**When to use it:** When you need help with installation, CLI commands, slash commands, keyboard shortcuts, configuration, CLAUDE.md, memory system, MCP integrations, hooks, subagents, workflows, troubleshooting, or cost management.

**Model:** `sonnet` - **Color:** yellow

**Example prompts:**
- *"How do I use Claude Code in a CI/CD pipeline without interactive prompts?"*
- *"My CLAUDE.md instructions aren't being applied, why?"*
- *"How do I automatically run ESLint every time Claude edits a file?"*
- *"Can Claude work on two features at the same time?"*

**Install:**
```bash
cp agents/claude-code-expert.md ~/.claude/agents/
```

---

### `code-reviewer`

> Senior code review specialist focused on defects, regressions, missing tests, and merge risk.

**When to use it:** When you need a code review, PR review, diff review, commit review, or risk assessment before merging.

**Model:** `sonnet` - **Color:** red

**Example prompts:**
- *"Review my changes before I send this."*
- *"Can you review PR #42?"*
- *"I refactored the auth middleware. Look for anything dangerous."*

**Install:**
```bash
cp agents/code-reviewer.md ~/.claude/agents/
```

---

### `test-engineer`

> Test engineering specialist for focused, reliable coverage and flaky test diagnosis.

**When to use it:** When you need to design, write, fix, or improve unit tests, integration tests, end-to-end tests, regression tests, fixtures, mocks, or CI test failures.

**Model:** `sonnet` - **Color:** green

**Example prompts:**
- *"Add tests for this new billing rule."*
- *"This test is flaky in CI but passes locally."*
- *"What tests should we add for the migration?"*

**Install:**
```bash
cp agents/test-engineer.md ~/.claude/agents/
```

---

### `repo-cartographer`

> Repository cartographer for onboarding, architecture mapping, and code path discovery.

**When to use it:** When you need to understand an unfamiliar repository, trace a feature flow, find where to make a change, or map module boundaries.

**Model:** `sonnet` - **Color:** blue

**Example prompts:**
- *"Help me understand how authentication works in this repo."*
- *"Where should I add support for export filters?"*
- *"Give me a map of the API layer and its dependencies."*

**Install:**
```bash
cp agents/repo-cartographer.md ~/.claude/agents/
```

---

## Cheatsheet

The [`claude-code-cheatsheet.html`](./claude-code-cheatsheet.html) file is a complete visual reference for Claude Code including:

- Installation and CLI commands
- Slash commands organized by category
- Detailed CLI flags
- Memory system (CLAUDE.md + Auto Memory)
- Workflows and pipelines
- Keyboard shortcuts

Open it in the browser or print/save as PDF using the built-in button.

---

## Repo structure

```
claude-code-agents/
+-- agents/
|   +-- claude-code-expert.md
|   +-- code-reviewer.md
|   +-- repo-cartographer.md
|   +-- test-engineer.md
+-- claude-code-cheatsheet.html
+-- README.md
```

---

## Contributing

If you have a useful agent you would like to share, open a PR with the `.md` file in the `agents/` folder following the standard Claude Code subagents format.

---

*Built with Claude Code*
