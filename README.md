# refresh

Keep fresh-session quality without losing your project's memory.

Long Claude Code sessions eventually degrade: context drift, repeated answers, forgotten decisions, weaker reasoning, and reduced focus.
Starting a new session restores performance.
But a simple `/clear` also wipes out valuable context.
`refresh` gives you the best of both worlds.
Capture the important state of your current work, start a fresh session, then continue exactly where you left off.

Instead of continuing inside a degraded session, capture the current state, clear the context, and resume from a structured handoff.

## Install

Download the ZIP, then run `install.ps1` (Windows) or `install.sh` (macOS/Linux). Full steps in [INSTALL.md](INSTALL.md). Then type `/refresh` inside Claude Code.

## `/refresh` vs `/compact`

`/compact` summarizes the conversation in place: same session, same window. `refresh` writes a handoff, you `/clear`, and you resume in an empty context.

* **Real reset, not a rolling summary.** `/compact` keeps the accumulated noise (old tool output, dead ends) inside its summary. `refresh` plus `/clear` restarts from a clean window and reloads only the handoff.
* **You control what survives.** The handoff is a file you can read, edit, and verify before resuming.
* **It persists on disk.** `latest.md` stays after the session ends; a compacted context lives only inside the session.

Trade-off: `refresh` is a 3-step manual flow (capture, `/clear`, resume), while `/compact` is one command. See [Limitations](#limitations).

## Usage

```bash
/refresh
```

Captures the current session into a handoff file.

```bash
/clear
```

Starts a fresh Claude Code session with a clean context window.

```bash
/refresh resume
```

Reloads the handoff and continues from where you left off.

## Workflow

```text
1. Work normally in Claude Code
2. Run /refresh
3. Run /clear
4. Run /refresh resume
5. Continue with fresh context and restored project state
```

## Handoff file

The latest handoff is overwritten on every capture.

**Windows**

```text
%USERPROFILE%\.claude\handoffs\latest.md
```

**macOS / Linux**

```text
~/.claude/handoffs/latest.md
```

## What gets preserved

The handoff is designed to preserve the most useful parts of the session:

* current goal
* project context
* important decisions
* constraints
* open tasks
* implementation direction
* relevant files or commands discussed

## Benefits

* Restore fresh-session response quality
* Reduce context drift
* Preserve important decisions and constraints
* Continue long-running projects safely
* Avoid losing progress when resetting context
* Keep Claude focused on what matters

## Limitations

A skill cannot run `/clear` or open a new session automatically.
You must run `/clear` manually between:

```bash
/refresh
```

and:

```bash
/refresh resume
```

## Verified

The [`evals/`](evals/) folder has an A/B protocol that measures whether the handoff preserves the thread across a `/clear`:

* [`probe.md`](evals/probe.md): the task given to Claude
* [`answer-key.md`](evals/answer-key.md): the scoring grid (thread retention and answer quality)
* [`test-protocol.md`](evals/test-protocol.md): how to run the A/B comparison in a clean session

## Goal

Keep the quality of a fresh Claude Code session while preserving the continuity of a long-running project.
