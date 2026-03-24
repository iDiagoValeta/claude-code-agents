# Claude Code Agents

A collection of personal agents for [Claude Code](https://claude.ai/code) — Anthropic's official CLI.

---

## What is this?

This repository contains custom subagents ready to use with Claude Code. Each agent has a specific purpose and is optimized to respond accurately within its domain.

It also includes an **interactive cheatsheet** covering all Claude Code commands, flags, and shortcuts.

---

## How to install agents

Copy the `.md` file of the agent you want into your agents directory:

```bash
# Available globally (all projects)
~/.claude/agents/

# Available only for the current project
.claude/agents/
```

Then restart Claude Code or run `/agents` to verify it's available.

---

## Available agents

### `claude-code-expert`

> Expert on everything related to Claude Code — Anthropic's official agentic CLI.

**When to use it:** When you need help with installation, CLI commands, slash commands, keyboard shortcuts, configuration, CLAUDE.md, memory system, MCP integrations, hooks, subagents, workflows, troubleshooting, or cost management.

**Model:** `sonnet` · **Color:** yellow

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

## Cheatsheet

The [`claude-code-cheatsheet.html`](./claude-code-cheatsheet.html) file is a complete visual reference for Claude Code including:

- Installation and CLI commands
- All slash commands organized by category
- Detailed CLI flags
- Memory system (CLAUDE.md + Auto Memory)
- Workflows and pipelines
- Keyboard shortcuts

Open it in the browser or print/save as PDF using the built-in button.

---

## Repo structure

```
claude-code-agents/
├── agents/
│   └── claude-code-expert.md      # Expert agent on Claude Code
└── claude-code-cheatsheet.html    # Interactive visual cheatsheet
```

---

## Contributing

If you have a useful agent you'd like to share, open a PR with the `.md` file in the `agents/` folder following the standard Claude Code subagents format.

---

*Built with Claude Code*
