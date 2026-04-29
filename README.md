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

### `plan-refiner`

> Planning and instruction-refinement specialist that turns rough requests into executable briefs.

**When to use it:** When a request is broad, ambiguous, high-risk, multi-step, or when you want help expressing a better prompt before implementation. It complements `/plan`: `/plan` keeps Claude in read-only planning mode, while this agent improves the user's instructions, assumptions, acceptance criteria, and handoff prompt.

**Model:** `sonnet` - **Color:** purple

**Example prompts:**
- *"Help me ask this better: make the dashboard faster."*
- *"Before touching code, help me plan how to add SSO."*
- *"Refactor the payments module to be cleaner, but first turn that into a concrete plan."*

**Install:**
```bash
cp agents/plan-refiner.md ~/.claude/agents/
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

### `logical-core-refactor`

> Large-file modularization specialist that splits monolithic files into focused logical modules while keeping the original file as the public API facade.

**When to use it:** When a file is too large to work with comfortably (>2000 lines, context saturation, mixed responsibilities) and you want it split into organized modules without breaking any existing imports or changing behavior. The original file becomes a thin facade that delegates to the new modules — external call sites require zero changes.

**Model:** `sonnet` - **Color:** cyan

**Example prompts:**
- *"This services/user.ts is way too big. Split it into logical modules but don't break anything."*
- *"Claude keeps losing context with utils/api.py — it's 4000 lines. Break it up."*
- *"Our controllers/main.go mixes handlers, validators, and DB logic. Organize it."*
- *"Split this file into modules but don't touch how anything is called externally."*

**Install:**
```bash
cp agents/logical-core-refactor.md ~/.claude/agents/
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
|   +-- logical-core-refactor.md
|   +-- plan-refiner.md
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
