# Test protocol — does `refresh` actually recover quality?

The goal is an **A/B test**: same task, two conditions — (A) degraded bloated context,
(B) after `/refresh` → `/clear` → `/refresh resume`. If B scores higher than A on quality
*and* keeps the thread (recalls the planted facts), the skill works.

This adapts two published methods:
- **Context Rot** (Chroma, 2025): hold task difficulty constant, vary only context size.
- **Lost in Multi-Turn** (Microsoft, 2025): measure recovery after a long conversation.

The standard academic benchmarks (NIAH, RULER) measure the *model*, not a *workflow*, so
they can't answer "did my handoff help". This protocol can.

## Why you must bloat the context first

`refresh` only helps when the context is genuinely degraded. On a short, clean session it
will show no gain (and may even drop nuance). So the test deliberately fills the context
before measuring — otherwise you're testing nothing.

## Procedure

Run this in a real Claude Code session.

### 1. Plant the thread (turn 0)
Paste the contents of `probe.md` **section A (Anchor facts)** and say:
"Remember these for later, we'll build on them." Do not reveal `answer-key.md`.

### 2. Bloat the context (the degradation)
Do ~15–30 turns of unrelated, context-filling work in the SAME session: read large files,
paste logs, ask tangential questions, go down a dead end and abandon it. The point is to
recreate a real long, messy session. A rough target: push context usage high (watch the
context indicator). The messier and more contradictory, the better the test.

### 3. Condition A — measure DEGRADED (no refresh)
Without resetting, paste `probe.md` **section B (Recall)** and **section C (Quality task)**.
Save the answers verbatim. Score with `answer-key.md`. This is your baseline.

### 4. Condition B — measure REFRESHED
In the same session:
1. `/refresh`        → it writes the handoff
2. `/clear`          → you type this; context is now clean
3. `/refresh resume` → it reloads the handoff
Then paste the SAME section B + section C. Save the answers. Score with `answer-key.md`.

### 5. Compare
- **Thread retention** (section B, /5): did the planted facts survive the reset? This is the
  whole promise of the skill — B should be ≥ A here. If B loses facts, the handoff template
  is missing something; improve what it captures.
- **Quality** (section C, /6): did response quality recover? B should be ≥ A. If the original
  session was badly degraded, the gap is the value the skill delivered.

### Reading the result
| Outcome | Meaning |
|---|---|
| B retention ≥ A **and** B quality > A | Skill works: thread kept, quality recovered. |
| B retention < A | Handoff is dropping context. Expand the template / capture step. |
| B quality ≈ A and both high | Context wasn't degraded enough — bloat harder, retest. |
| B quality < A | Either the reset lost nuance, or step 2 didn't degrade. Investigate. |

## Rigor notes (so you trust the number)
- **Run it 2–3 times.** LLM outputs vary; a single run is noise. Average the scores.
- **Same probe each run** so only the condition changes (Context Rot's controlled-variable idea).
- **Blind scoring helps:** score the saved answers later without remembering which was A or B.
- Optional automated grading: feed both answer sets + `answer-key.md` to a *fresh* Claude with
  "score each against the key, 0/1 per item, no memory of which is which."
