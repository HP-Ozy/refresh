# refresh

Keep fresh-session quality without losing your project's memory.

Long Claude Code sessions eventually degrade: context drift, repeated answers, forgotten decisions, weaker reasoning, and reduced focus.
Starting a new session restores performance.
But a simple `/clear` also wipes out valuable context.
`refresh` gives you the best of both worlds.
Capture the important state of your current work, start a fresh session, then continue exactly where you left off.

📦 **Installation:** see [INSTALL.md](INSTALL.md).
Download the ZIP and run `install.ps1` on Windows or `install.sh` on macOS/Linux.
Then type `/refresh` inside Claude Code.

## Why

The problem isn't the model.
The problem is the session.
As conversations grow, context becomes increasingly noisy. Even strong models can begin to:

* repeat themselves
* lose track of previous decisions
* miss important constraints
* generate less focused responses
* spend context on outdated information

Instead of continuing inside a degraded session, capture the current state, clear the context, and resume from a structured handoff.

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

## Goal

Keep the quality of a fresh Claude Code session while preserving the continuity of a long-running project.
