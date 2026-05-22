# Claude Code Agents

A collection of personal agents for [Claude Code](https://claude.ai/code), Anthropic's official CLI.

---

## What is this?

This repository is a library of ready-to-use building blocks for Claude Code:

- **Agents** — custom subagents, each focused on a specific domain.
- **Skills** — reusable workflows that run in your main conversation.
- **Hooks** — deterministic automation that runs on Claude Code events.

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

## Authoring guides

Before adding or changing an element, follow the guide for its type:

- Agents — [`docs/agent-authoring-guide.md`](./docs/agent-authoring-guide.md)
- Skills — [`docs/skill-authoring-guide.md`](./docs/skill-authoring-guide.md)
- Hooks — [`docs/hook-authoring-guide.md`](./docs/hook-authoring-guide.md)

They document the local format conventions and the official Anthropic references.

---

## Available agents

| Agent                                                                  | Purpose                                                                                                                                           |
| ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| [`ci-cd-maintainer`](./agents/ci-cd-maintainer.md)                     | Diagnose and repair existing CI/CD workflows, runner issues, secrets, caches, artifacts, deployment jobs, and release automation failures.        |
| [`ci-cd-pipeline-builder`](./agents/ci-cd-pipeline-builder.md)         | Create or extend CI/CD workflows, build pipelines, release automation, deployment gates, artifact publishing, and repository automation.          |
| [`claude-code-expert`](./agents/claude-code-expert.md)                 | Answer questions about Claude Code itself: installation, commands, configuration, memory, hooks, MCP, subagents, workflows, and troubleshooting.  |
| [`code-reviewer`](./agents/code-reviewer.md)                           | Review code, PRs, diffs, commits, and risky changes for defects, regressions, missing tests, and merge risk.                                      |
| [`commit-and-pr-author`](./agents/commit-and-pr-author.md)             | Draft clean commit messages, logical commit splits, and reviewer-focused PR descriptions from the actual diff and history.                        |
| [`dependency-upgrader`](./agents/dependency-upgrader.md)               | Update dependencies, resolve breaking changes, remediate vulnerabilities, and keep lockfiles deterministic, verified by the project's own checks. |
| [`logical-core-refactor`](./agents/logical-core-refactor.md)           | Split very large files into logical modules while preserving the original public API surface as a facade.                                         |
| [`plan-refiner`](./agents/plan-refiner.md)                             | Turn broad, ambiguous, high-risk, or underspecified requests into executable briefs, assumptions, acceptance criteria, and handoff prompts.       |
| [`jupyter-notebook-cleaner`](./agents/jupyter-notebook-cleaner.md)     | Clean, reorganize, and document Jupyter notebooks: fix execution order, consolidate imports, add section headers, and remove dead cells.          |
| [`python-refactorer`](./agents/python-refactorer.md)                   | Refactor existing Python code for structure, readability, maintainability, and responsibility boundaries while preserving behavior.               |
| [`rag-pipeline-debugger`](./agents/rag-pipeline-debugger.md)           | Debug RAG pipelines stage by stage: chunking, embedding, vector store, retrieval, reranking, prompt assembly, and LLM response.                  |
| [`repo-cartographer`](./agents/repo-cartographer.md)                   | Map unfamiliar repositories, feature flows, module boundaries, dependency paths, and safe insertion points.                                       |
| [`root-cause-debugger`](./agents/root-cause-debugger.md)               | Reproduce, isolate, and find the root cause of a bug, then apply the minimal verified fix. Language-agnostic.                                     |
| [`security-auditor`](./agents/security-auditor.md)                     | Proactively audit a whole codebase for secrets, broken authz, injection, and OWASP-class risks, with exploit paths and remediation.               |
| [`test-engineer`](./agents/test-engineer.md)                           | Design, write, fix, or improve tests, test strategy, fixtures, mocks, regression coverage, flaky tests, and CI test failures.                     |
| [`typescript-documenter`](./agents/typescript-documenter.md)           | Improve TypeScript JSDoc, module READMEs, public API documentation, explanatory comments, and type-driven documentation.                          |
| [`typescript-feature-builder`](./agents/typescript-feature-builder.md) | Implement new TypeScript features with minimal scope, clear type contracts, safe dependency boundaries, and proportional verification.            |
| [`typescript-refactorer`](./agents/typescript-refactorer.md)           | Refactor existing TypeScript for structure, readability, maintainability, and responsibility boundaries while preserving behavior.                |

---

### `claude-code-expert`

> Expert on everything related to Claude Code, Anthropic's official agentic CLI.

**When to use it:** When you need help with installation, CLI commands, slash commands, keyboard shortcuts, configuration, CLAUDE.md, memory system, MCP integrations, hooks, subagents, workflows, troubleshooting, or cost management.

**Model:** `sonnet` - **Color:** yellow

**Example prompts:**

- _"How do I use Claude Code in a CI/CD pipeline without interactive prompts?"_
- _"My CLAUDE.md instructions aren't being applied, why?"_
- _"How do I automatically run ESLint every time Claude edits a file?"_
- _"Can Claude work on two features at the same time?"_

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

- _"Review my changes before I send this."_
- _"Can you review PR #42?"_
- _"I refactored the auth middleware. Look for anything dangerous."_

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

- _"Add tests for this new billing rule."_
- _"This test is flaky in CI but passes locally."_
- _"What tests should we add for the migration?"_

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

- _"Add GitHub Actions CI for lint, typecheck, tests, and build."_
- _"Create a release workflow that publishes Docker images on tags."_
- _"Add a production deployment workflow with a manual approval gate."_

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

- _"Fix the GitHub Actions workflow that started failing after the Node upgrade."_
- _"Diagnose why this deployment job cannot read the production secret."_
- _"Make this flaky CI cache setup deterministic without skipping tests."_

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

- _"Add support for gas invoices using the existing parser pattern."_
- _"Implement the new billing status flow without overbuilding future states."_
- _"Add this provider behind the existing AI client abstraction."_

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

- _"Refactor this checkout service without changing behavior."_
- _"Split this large TypeScript handler into clearer responsibilities."_
- _"Remove the duplicated validation logic, but add characterization tests first."_

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

- _"Add JSDoc to the public billing calculation utilities."_
- _"Create a README for this API module based on the actual code."_
- _"Replace these noisy comments with useful why-oriented documentation."_

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

- _"Help me ask this better: make the dashboard faster."_
- _"Before touching code, help me plan how to add SSO."_
- _"Refactor the payments module to be cleaner, but first turn that into a concrete plan."_

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

- _"Help me understand how authentication works in this repo."_
- _"Where should I add support for export filters?"_
- _"Give me a map of the API layer and its dependencies."_

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

- _"This services/user.ts is way too big. Split it into logical modules but don't break anything."_
- _"Claude keeps losing context with utils/api.py — it's 4000 lines. Break it up."_
- _"Our controllers/main.go mixes handlers, validators, and DB logic. Organize it."_
- _"Split this file into modules but don't touch how anything is called externally."_

**Install:**

```bash
cp agents/logical-core-refactor.md ~/.claude/agents/
```

---

### `root-cause-debugger`

> Root-cause debugging specialist that reproduces, isolates, and fixes the true cause of a defect.

**When to use it:** When you hit a bug, crash, exception, failing test, wrong output, or regression and want the underlying cause found and the minimal fix applied, with evidence at each step. Language-agnostic.

**Model:** `sonnet` - **Color:** green

**Example prompts:**

- _"I'm getting a TypeError in checkout. Find the cause and fix it."_
- _"This test passed yesterday and now fails intermittently. Figure out why."_
- _"Invoices total incorrectly for one customer tier, but no error is thrown."_

**Install:**

```bash
cp agents/root-cause-debugger.md ~/.claude/agents/
```

---

### `dependency-upgrader`

> Dependency upgrade and vulnerability remediation specialist for npm, pnpm, and yarn.

**When to use it:** When you need to update dependencies, bump across a major version, resolve breaking changes, fix a security advisory, or reconcile a lockfile, with the project's own build and tests proving the result.

**Model:** `sonnet` - **Color:** orange

**Example prompts:**

- _"npm audit shows a high-severity issue. Fix it safely."_
- _"Upgrade us from this library v3 to v5 and handle the breaking changes."_
- _"Our pnpm-lock.yaml has conflicts after merging main. Sort it out."_

**Install:**

```bash
cp agents/dependency-upgrader.md ~/.claude/agents/
```

---

### `security-auditor`

> Proactive whole-codebase security auditor focused on exploitable findings.

**When to use it:** When you want a security pass over a codebase or surface area (not just a diff): exposed secrets, broken authentication/authorization, injection, insecure data handling, and OWASP-class risks. For diff/PR-scoped review, use `code-reviewer` instead.

**Model:** `sonnet` - **Color:** purple

**Example prompts:**

- _"We're launching next week. Audit the API and auth layers."_
- _"Check whether we're leaking any secrets or logging sensitive data."_
- _"Give me an OWASP-oriented review of the user-facing endpoints."_

**Install:**

```bash
cp agents/security-auditor.md ~/.claude/agents/
```

---

### `commit-and-pr-author`

> Commit message and pull request description specialist that writes from the real diff.

**When to use it:** When you want a clean commit message, a logical commit split, or a reviewer-focused PR description derived from the actual diff and history, following your repo's conventions. It never modifies source files.

**Model:** `sonnet` - **Color:** blue

**Example prompts:**

- _"Write a commit message for what I've staged."_
- _"Draft a PR description for this branch against main."_
- _"I made a bunch of changes at once. Help me split this into sensible commits."_

**Install:**

```bash
cp agents/commit-and-pr-author.md ~/.claude/agents/
```

---

### `python-refactorer`

> Python refactoring specialist focused on behavior preservation and incremental cleanup.

**When to use it:** When you need to improve existing Python structure, readability, maintainability, dependency boundaries, or duplication while preserving current behavior with tests or characterization coverage. Covers scripts, packages, data-science pipelines, and ML code.

**Model:** `sonnet` - **Color:** white

**Example prompts:**

- _"Refactor this data-loading script without changing behavior."_
- _"Split this large Python module into clearer responsibilities."_
- _"Replace these ad-hoc dicts with dataclasses, but add tests first."_

**Install:**

```bash
cp agents/python-refactorer.md ~/.claude/agents/
```

---

### `rag-pipeline-debugger`

> RAG pipeline debugging specialist that diagnoses each stage and applies the narrowest correct fix.

**When to use it:** When a retrieval-augmented generation system returns wrong answers, misses relevant documents, hallucinates, or produces poor context quality. Covers chunking, embedding, vector store indexing, retrieval parameters, reranking, prompt assembly, and LLM response.

**Model:** `sonnet` - **Color:** pink

**Example prompts:**

- _"My RAG chatbot keeps returning unrelated documents for specific queries."_
- _"The pipeline retrieves the right chunks but the LLM still gives wrong answers."_
- _"After updating the documents, answers are still stale. Find the cause."_

**Install:**

```bash
cp agents/rag-pipeline-debugger.md ~/.claude/agents/
```

---

### `jupyter-notebook-cleaner`

> Jupyter notebook quality specialist for reproducibility, structure, and shareability.

**When to use it:** When you want to clean, reorganize, or prepare a Jupyter notebook for sharing, code review, or publication. Handles execution-order issues, scattered imports, missing markdown headers, dead/debug cells, oversized outputs, and utility code that belongs in a `.py` file.

**Model:** `sonnet` - **Color:** yellow

**Example prompts:**

- _"Clean up this training notebook before I push it to GitHub."_
- _"This notebook has cells out of order and no section headers. Fix it."_
- _"Remove all the debug prints and make sure imports are at the top."_

**Install:**

```bash
cp agents/jupyter-notebook-cleaner.md ~/.claude/agents/
```

---

## Available skills

Skills are reusable workflows that run in your main Claude Code conversation. Install one by copying its directory:

```bash
# Available globally (all projects)
cp -r skills/<name> ~/.claude/skills/

# Available only for the current project
cp -r skills/<name> .claude/skills/
```

| Skill                                                  | Purpose                                                                                                             |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| [`new-agent`](./skills/new-agent/SKILL.md)             | Scaffold a new agent in this library following the authoring guide, then register it in README.md.                  |
| [`validate-agents`](./skills/validate-agents/SKILL.md) | Validate that every agent has well-formed frontmatter and is documented in README.md (enforces the CLAUDE.md rule). |
| [`release-notes`](./skills/release-notes/SKILL.md)     | Generate release notes / a CHANGELOG entry from commits since the last tag.                                         |

After copying, restart Claude Code or run `/help` to see the new command.

---

## Available hooks

Hooks are deterministic automation that runs on Claude Code events. Each is a shell script plus a settings snippet. To install one: copy its script into `.claude/hooks/`, make it executable, and merge its `settings.snippet.json` into `.claude/settings.json`. Review any hook before enabling it — hooks run shell commands automatically.

| Hook                                                         | Event       | Purpose                                                                                           |
| ------------------------------------------------------------ | ----------- | ------------------------------------------------------------------------------------------------- |
| [`agent-readme-guard`](./hooks/agent-readme-guard/README.md)               | PostToolUse | Reminds you to update README.md when an `agents/*.md` file changes.                               |
| [`block-secret-edits`](./hooks/block-secret-edits/README.md)               | PreToolUse  | Blocks edits to sensitive files and Bash commands that would commit them.                         |
| [`format-on-edit`](./hooks/format-on-edit/README.md)                       | PostToolUse | Runs Prettier (and `eslint --fix` for JS/TS) on each edited file; no-ops if the tools are absent. |
| [`strip-notebook-outputs`](./hooks/strip-notebook-outputs/README.md)       | PostToolUse | Strips cell outputs from `.ipynb` files after each edit; no-ops safely when nbstripout is absent. |

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
|   +-- commit-and-pr-author.md
|   +-- dependency-upgrader.md
|   +-- jupyter-notebook-cleaner.md
|   +-- logical-core-refactor.md
|   +-- plan-refiner.md
|   +-- python-refactorer.md
|   +-- rag-pipeline-debugger.md
|   +-- repo-cartographer.md
|   +-- root-cause-debugger.md
|   +-- security-auditor.md
|   +-- test-engineer.md
|   +-- typescript-documenter.md
|   +-- typescript-feature-builder.md
|   +-- typescript-refactorer.md
+-- skills/
|   +-- new-agent/
|   +-- release-notes/
|   +-- validate-agents/
+-- hooks/
|   +-- agent-readme-guard/
|   +-- block-secret-edits/
|   +-- format-on-edit/
|   +-- strip-notebook-outputs/
+-- docs/
|   +-- agent-authoring-guide.md
|   +-- hook-authoring-guide.md
|   +-- skill-authoring-guide.md
+-- claude-code-cheatsheet.html
+-- README.md
```

---

## Contributing

If you have a useful agent you would like to share, open a PR with the `.md` file in the `agents/` folder following the standard Claude Code subagents format.

---

_Built with Claude Code_
