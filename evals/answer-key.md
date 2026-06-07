# Answer key & scoring — keep hidden from the test session

Score condition A (degraded) and condition B (refreshed) separately, then compare.
Total = thread retention (/5) + quality (/6).

## SECTION B — Thread retention (1 point each, /5)

| # | Required facts | Full (1) | Partial (0.5) |
|---|---|---|---|
| B1 | SQLite **and** reason = single-user desktop / no concurrency | both | DB right, reason vague/missing |
| B2 | port **8412** **and** **`basalt.toml`** | both | one of two |
| B3 | **`fastparse`** **and** reason = dropped Windows support | both | name right, reason missing |
| B4 | **3 attempts**, **exponential backoff**, **500 ms** start | all three | any one missing |
| B5 | **auth** deferred to phase 2 **and** PK = **UUIDv7** | both | one of two |

A hallucinated but confident wrong answer scores **0** (worse than "I don't recall").
Note any invented facts — fabrication under degradation is itself a degradation signal.

## SECTION C — Quality (/6)

| # | Correct answer | Points |
|---|---|---|
| C1 | **Prize is in B.** (Only "prize in B" makes exactly one label — C — true.) | 2 if answer **B** with valid reasoning; 1 if B without/with flawed reasoning; 0 otherwise |
| C2 | **74 L.** (240 − 12·8 = 144; then net −7 L/min · 10 = −70 → 74) | 2 if 74; 1 if right method, arithmetic slip; 0 otherwise |
| C3 | Function returns first-occurrence order, e.g. via a `seen` set. `[3,1,3,2,1]`→`[3,1,2]` | 2 if correct & order-preserving; 1 if dedupes but loses order (e.g. `set()`); 0 if wrong |

### C1 worked check (for the grader)
- prize in A → A true, B true, C false → 2 true ✗
- prize in B → A false, B false, C true → **1 true ✓**
- prize in C → A false, B true, C true → 2 true ✗

## Verdict
- **B retention ≥ A** → the handoff preserved the thread (the skill's core promise).
- **B quality > A** → the reset recovered response quality. The gap = the skill's value.
- Average over 2–3 runs; single runs are noisy.
