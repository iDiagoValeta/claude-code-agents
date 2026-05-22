---
name: release-notes
description: "Generate release notes / a CHANGELOG entry from commits since the last tag. Groups changes into Added, Changed, Fixed, Security, and Breaking changes, and highlights migration steps. Use when cutting a release or writing a changelog."
argument-hint: "[from-ref] [to-ref]"
allowed-tools: Bash(git *) Read Edit
---

# Release notes

Generate human-readable release notes from the project's git history.

- Start ref (`$1`), defaults to the latest tag if omitted.
- End ref (`$2`), defaults to `HEAD` if omitted.

## Latest tag

!`git describe --tags --abbrev=0 2>/dev/null || echo "(no tags yet)"`

## Commits in range

!`git log ${1:-$(git describe --tags --abbrev=0 2>/dev/null)}..${2:-HEAD} --no-merges --pretty=format:'%h %s' 2>/dev/null || git log --no-merges --pretty=format:'%h %s' -50`

## Steps

1. Use the commit list above. If a range was given, respect it; otherwise the
   list already spans the last tag to `HEAD`.
2. Classify each commit into a section, inferring from conventional-commit
   prefixes when present and from the message otherwise:
   - `feat` → **Added**
   - `fix` → **Fixed**
   - `refactor`, `perf`, `chore`, `build`, `style`, `docs` → **Changed**
     (omit purely internal noise that users do not care about)
   - anything security-relevant (advisories, auth, secrets) → **Security**
   - any commit marked breaking (`!` or `BREAKING CHANGE`) → **Breaking changes**
     with a one-line migration note
3. Rewrite each entry as a user-facing line (what changed and why it matters),
   not the raw commit subject. Drop entries that have no user impact.
4. Produce the entry using `${CLAUDE_SKILL_DIR}/templates/changelog-entry.md`,
   omitting empty sections.

## Output

Print the finished release-notes block. If the repository has a `CHANGELOG.md`,
offer to prepend the new entry, and only edit it after the user confirms the
version number and date.
