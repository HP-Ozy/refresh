# Probe — paste these into the test session

Keep `answer-key.md` hidden from the model. Sections A, B, C are pasted at different stages
(see `test-protocol.md`).

---

## SECTION A — Anchor facts (paste at turn 0)

> "We're starting a project. Remember these decisions — we'll build on them later:"

1. Project codename: **Basalt**.
2. Database: **SQLite**, chosen over Postgres because it's a single-user desktop app with no concurrency needs.
3. The API listens on port **8412**.
4. Max upload size: **25 MB**.
5. We rejected the library **`fastparse`** because it dropped Windows support.
6. Scheduling timezone: **Europe/Rome**.
7. Retry policy: **3 attempts, exponential backoff starting at 500 ms**.
8. Primary-key strategy: **UUIDv7**.
9. The **auth feature is deferred to phase 2**.
10. Config file is named **`basalt.toml`** (not config.yaml).

---

## SECTION B — Recall (paste in BOTH condition A and condition B)

> "Before we continue, from what we decided earlier — no guessing, no re-reading prompts:"

- **B1.** Which database did we choose, and what was the reason?
- **B2.** What port does the API use, and what is the config file called?
- **B3.** Which library did we reject, and why?
- **B4.** State the exact retry policy.
- **B5.** What did we defer to phase 2, and what is the primary-key strategy?

---

## SECTION C — Quality task (paste in BOTH condition A and condition B)

> "Now three quick problems. Answer carefully."

- **C1 (logic).** Three boxes A, B, C. Exactly one contains a prize.
  - Label on A: "The prize is in A."
  - Label on B: "The prize is not in B."
  - Label on C: "The prize is not in A."
  - Exactly one label is true. Where is the prize? Show reasoning.

- **C2 (multi-step).** A tank holds 240 L and starts full. It drains at 12 L/min for the
  first 8 minutes. Then, for the next 10 minutes, a pump adds 5 L/min while it keeps draining
  at 12 L/min. How many litres remain after 18 minutes total?

- **C3 (code).** Write a Python function `dedupe_keep_order(items)` that removes duplicates
  while preserving first-occurrence order. Example: `dedupe_keep_order([3,1,3,2,1])` → `[3,1,2]`.
