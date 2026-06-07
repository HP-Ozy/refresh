# refresh

> 📦 **Installazione (anche per non esperti):** vedi **[INSTALL.md](INSTALL.md)**.
> In breve: scarica lo ZIP e lancia `install.ps1` (Windows) o `install.sh` (macOS/Linux),
> poi scrivi `/refresh` in Claude Code.

Reset session degradation without losing the thread.

Long sessions degrade response quality (full context = drift, repetition, forgotten
decisions). A clean context restores quality, but a plain `/clear` loses your work.
`refresh` bridges the two.

## Usage

```
/refresh            # CAPTURE: write a handoff of the current thread to a stable file
/clear              # you run this — fresh context = full quality restored
/refresh resume     # RESUME: reload the handoff and continue where you left off
```

Handoff file (overwritten each capture):
- Windows: `%USERPROFILE%\.claude\handoffs\latest.md`
- POSIX:   `~/.claude/handoffs/latest.md`

## Note

A skill can't run `/clear` or open a new session by itself — that step is yours. `refresh`
prepares the handoff and re-grounds afterward; you type the `/clear` in between.
