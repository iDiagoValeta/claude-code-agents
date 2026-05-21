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

## Agent authoring guide

Before adding or changing agents, follow [`docs/agent-authoring-guide.md`](./docs/agent-authoring-guide.md). It documents the local format conventions and official Anthropic references for writing Claude Code subagents.

---

## Available agents

| Agent | Purpose |
|---|---|
| [`ci-cd-maintainer`](./agents/ci-cd-maintainer.md) | Diagnose and repair existing CI/CD workflows, runner issues, secrets, caches, artifacts, deployment jobs, and release automation failures. |
| [`ci-cd-pipeline-builder`](./agents/ci-cd-pipeline-builder.md) | Create or extend CI/CD workflows, build pipelines, release automation, deployment gates, artifact publishing, and repository automation. |
| [`claude-code-expert`](./agents/claude-code-expert.md) | Answer questions about Claude Code itself: installation, commands, configuration, memory, hooks, MCP, subagents, workflows, and troubleshooting. |
| [`code-reviewer`](./agents/code-reviewer.md) | Review code, PRs, diffs, commits, and risky changes for defects, regressions, missing tests, and merge risk. |
| [`logical-core-refactor`](./agents/logical-core-refactor.md) | Split very large files into logical modules while preserving the original public API surface as a facade. |
| [`plan-refiner`](./agents/plan-refiner.md) | Turn broad, ambiguous, high-risk, or underspecified requests into executable briefs, assumptions, acceptance criteria, and handoff prompts. |
| [`repo-cartographer`](./agents/repo-cartographer.md) | Map unfamiliar repositories, feature flows, module boundaries, dependency paths, and safe insertion points. |
| [`test-engineer`](./agents/test-engineer.md) | Design, write, fix, or improve tests, test strategy, fixtures, mocks, regression coverage, flaky tests, and CI test failures. |
| [`typescript-documenter`](./agents/typescript-documenter.md) | Improve TypeScript JSDoc, module READMEs, public API documentation, explanatory comments, and type-driven documentation. |
| [`typescript-feature-builder`](./agents/typescript-feature-builder.md) | Implement new TypeScript features with minimal scope, clear type contracts, safe dependency boundaries, and proportional verification. |
| [`typescript-refactorer`](./agents/typescript-refactorer.md) | Refactor existing TypeScript for structure, readability, maintainability, and responsibility boundaries while preserving behavior. |

---

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

### `ci-cd-pipeline-builder`

> CI/CD pipeline creation specialist for repository automation, release workflows, and deployment gates.

**When to use it:** When you need to create or extend CI/CD workflows, build pipelines, release automation, deployment gates, artifact publishing, or repository automation from the project's real scripts and infrastructure constraints.

**Model:** `sonnet` - **Color:** yellow

**Example prompts:**
- *"Add GitHub Actions CI for lint, typecheck, tests, and build."*
- *"Create a release workflow that publishes Docker images on tags."*
- *"Add a production deployment workflow with a manual approval gate."*

**Install:**
```bash
cp agents/ci-cd-pipeline-builder.md ~/.claude/agents/
```

---

### `ci-cd-maintainer`

> CI/CD maintenance and repair specialist for failing pipelines, runner issues, and deployment automation.

**When to use it:** When you need to debug failing pipelines, maintain existing workflows, update CI/CD configuration, fix runner or environment issues, improve pipeline reliability, or diagnose deployment automation failures.

**Model:** `sonnet` - **Color:** red

**Example prompts:**
- *"Fix the GitHub Actions workflow that started failing after the Node upgrade."*
- *"Diagnose why this deployment job cannot read the production secret."*
- *"Make this flaky CI cache setup deterministic without skipping tests."*

**Install:**
```bash
cp agents/ci-cd-maintainer.md ~/.claude/agents/
```

---

### `typescript-feature-builder`

> TypeScript feature implementation specialist for startup codebases.

**When to use it:** When you need to add a new TypeScript feature, workflow, endpoint, UI behavior, service, integration, or domain rule while keeping the change minimal, strongly typed, and safe.

**Model:** `sonnet` - **Color:** cyan

**Example prompts:**
- *"Add support for gas invoices using the existing parser pattern."*
- *"Implement the new billing status flow without overbuilding future states."*
- *"Add this provider behind the existing AI client abstraction."*

**Install:**
```bash
cp agents/typescript-feature-builder.md ~/.claude/agents/
```

---

### `typescript-refactorer`

> TypeScript refactoring specialist focused on behavior preservation and incremental cleanup.

**When to use it:** When you need to improve existing TypeScript structure, readability, maintainability, dependency boundaries, or duplication while preserving current behavior with tests or characterization coverage.

**Model:** `sonnet` - **Color:** orange

**Example prompts:**
- *"Refactor this checkout service without changing behavior."*
- *"Split this large TypeScript handler into clearer responsibilities."*
- *"Remove the duplicated validation logic, but add characterization tests first."*

**Install:**
```bash
cp agents/typescript-refactorer.md ~/.claude/agents/
```

---

### `typescript-documenter`

> TypeScript documentation specialist for useful JSDoc, module READMEs, and why-oriented comments.

**When to use it:** When you need to document exported APIs, module responsibilities, operational constraints, non-obvious business rules, or type-driven contracts in a TypeScript codebase.

**Model:** `sonnet` - **Color:** pink

**Example prompts:**
- *"Add JSDoc to the public billing calculation utilities."*
- *"Create a README for this API module based on the actual code."*
- *"Replace these noisy comments with useful why-oriented documentation."*

**Install:**
```bash
cp agents/typescript-documenter.md ~/.claude/agents/
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
|   +-- ci-cd-maintainer.md
|   +-- ci-cd-pipeline-builder.md
|   +-- claude-code-expert.md
|   +-- code-reviewer.md
|   +-- logical-core-refactor.md
|   +-- plan-refiner.md
|   +-- repo-cartographer.md
|   +-- test-engineer.md
|   +-- typescript-documenter.md
|   +-- typescript-feature-builder.md
|   +-- typescript-refactorer.md
+-- docs/
|   +-- agent-authoring-guide.md
+-- claude-code-cheatsheet.html
+-- README.md
```

---

## Contributing

If you have a useful agent you would like to share, open a PR with the `.md` file in the `agents/` folder following the standard Claude Code subagents format.

---

*Built with Claude Code*
