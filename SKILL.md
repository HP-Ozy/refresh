---
name: refresh
description: >
  Reset the session to recover response quality while keeping the conversation thread.
  Captures a complete handoff of the current work (goal, decisions, state, files, next steps)
  to a stable file so it survives a context reset, then resumes from it in a clean context.
  Use ONLY on explicit request: "/refresh", "responses getting worse / degrading", "reset the
  session but keep context", "start a fresh session but remember what we're doing", "clear but
  continue", "the conversation is too long, restart without losing the thread". Do NOT trigger
  on casual mentions of refreshing data, refreshing a page, or reloading — only on conversation/
  session quality reset. Two modes: capture (default) and resume (`/refresh resume`).
---

# refresh — reset degradation, keep the thread

## Why this exists

Over a long session the context window fills with old tool output, dead ends, and
back-and-forth. Quality drifts: the model repeats itself, forgets earlier decisions,
gets sloppy. A truly clean context restores full quality — but a naive `/clear` loses
everything you were doing.

This skill bridges that: it writes a tight, complete **handoff** of the live thread to a
stable file, you run `/clear` (fresh context = full quality), then resume from the handoff.
The new context knows the *substance* of the work without carrying the *cruft*.

**Honest limit:** a skill cannot run `/clear` itself or open a new session — that is a user
action. This skill prepares the handoff and re-grounds afterward; the `/clear` in between is
yours to type. Say this plainly to the user; never pretend the reset happened automatically.

## Handoff file location

Always use this exact stable path so resume can find it regardless of working directory:

- Windows: `%USERPROFILE%\.claude\handoffs\latest.md`
- POSIX:   `~/.claude/handoffs/latest.md`

Create the `handoffs` directory if missing. One file, overwritten each capture — the latest
handoff is the only one that matters. (If the user wants to keep history, copy it aside first.)

---

## Mode: CAPTURE (default — `/refresh`)

Goal: write everything a fresh Claude needs to continue with **zero loss of thread and zero
loss of quality**. Be complete on substance, ruthless on cruft. Skip what the fresh context
can re-read from files; capture what lives only in this conversation (decisions, rationale,
gotchas discovered, the current mental model).

### Steps

1. Reconstruct the thread from the conversation: the real goal, what's been decided and why,
   what's done vs in progress, which files/paths matter, what's next, what's blocking.
2. Write the handoff to the stable path using the template below.
3. Tell the user, in one short block:
   - the handoff path,
   - to run `/clear` now,
   - then to run `/refresh resume` to continue.

Do **not** keep working on the original task after capturing — the point is to stop and reset.

### Handoff template

Write exactly these sections. Omit a section only if genuinely empty; never pad.

```markdown
# Handoff — <one-line title of the work>
_Captured: <today's date>_

## Goal
<The real objective. What "done" looks like. The why, not just the what.>

## Status
<What is finished. What is in progress right now. The single next concrete action.>

## Key decisions (and why)
- <decision> — <reason / what it rules out>
- ...

## Files & paths
- `<path>` — <what it is / what changed / why it matters>
- ...

## Context the fresh session can't re-derive
<Gotchas found, constraints, dead ends already tried (so they aren't retried), environment
quirks, user preferences expressed this session, anything learned the hard way.>

## Next steps
1. <concrete step>
2. ...

## Open questions / blockers
- <thing still undecided or waiting on the user>
```

### Quality bar

- A competent Claude reading only this file + the referenced files should resume seamlessly.
- Prefer pointers over dumps: cite `path:line` and let the fresh context read it, rather than
  pasting large code blocks.
- Capture rationale, not just outcomes — "we chose X over Y because Z" prevents re-litigating.
- List dead ends explicitly. The biggest waste after a reset is retrying what already failed.

---

## Mode: RESUME (`/refresh resume`, also `/refresh go` / `/refresh continue`)

Goal: rebuild the working state from the handoff and pick up exactly where capture left off.

### Steps

1. Read the handoff file from the stable path. If it's missing, say so and ask whether to
   start fresh — do not guess.
2. Read the files it references (current state on disk wins over anything described — the
   handoff is a map, the files are the territory).
3. Briefly confirm to the user, in 2–4 lines: the goal, where things stand, and the next
   action you're about to take. This is the proof the thread survived.
4. Continue the work from the "Next steps" — honoring the decisions and avoiding the dead
   ends recorded in the handoff.

Keep the resume summary short. The user already knows the context; they want to see that *you*
do, then watch you proceed — not re-read a wall of text.
