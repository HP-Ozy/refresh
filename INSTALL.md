# Installazione e configurazione — guida per tutti

`refresh` è una **skill per Claude Code**. Installarla vuol dire copiare questa
cartella dentro la cartella delle skill di Claude. Non serve saper programmare:
segui i passi del tuo sistema operativo.

> Cos'è Claude Code? È l'assistente Claude che gira nel terminale / nell'app.
> Se non ce l'hai, installalo prima da: https://docs.claude.com/claude-code

---

## Metodo A — Installazione automatica (consigliato)

### Windows (PowerShell)

1. Scarica il progetto: clicca il pulsante verde **Code → Download ZIP** su GitHub,
   poi estrai lo ZIP (tasto destro → *Estrai tutto*).
2. Apri **PowerShell** (cerca "PowerShell" nel menu Start).
3. Entra nella cartella estratta, per esempio:
   ```powershell
   cd "$env:USERPROFILE\Downloads\refresh-main"
   ```
4. Lancia lo script di installazione:
   ```powershell
   .\install.ps1
   ```
5. Fatto. Apri (o riavvia) Claude Code e scrivi `/refresh`.

### macOS / Linux (Terminale)

```bash
cd ~/Downloads/refresh-main      # la cartella dove hai estratto lo ZIP
bash install.sh
```

---

## Metodo B — Installazione manuale (copia e incolla)

Se preferisci farlo a mano, copia la cartella della skill in:

- **Windows:** `%USERPROFILE%\.claude\skills\refresh\`
- **macOS / Linux:** `~/.claude/skills/refresh/`

Dentro `refresh\` devono finire **`SKILL.md`**, **`README.md`** e la cartella **`evals`**.
La cartella `.claude\skills` potrebbe non esistere: creala tu.

### Esempio Windows (PowerShell), dalla cartella del progetto:
```powershell
$dest = "$env:USERPROFILE\.claude\skills\refresh"
New-Item -ItemType Directory -Force -Path $dest | Out-Null
Copy-Item SKILL.md, README.md -Destination $dest -Force
Copy-Item evals -Destination $dest -Recurse -Force
```

### Esempio macOS / Linux:
```bash
mkdir -p ~/.claude/skills/refresh
cp -r SKILL.md README.md evals ~/.claude/skills/refresh/
```

---

## Verifica che funzioni

1. Apri Claude Code.
2. Scrivi `/refresh` e premi invio.
3. Se compare la skill (cattura un *handoff* della sessione), è installata. ✅

Se `/refresh` non compare: chiudi e riapri Claude Code (rilegge le skill all'avvio).

---

## Come si usa (in breve)

| Comando | Cosa fa |
|---|---|
| `/refresh` | Salva un riassunto del lavoro in corso in un file stabile |
| `/clear` | **Lo scrivi tu**: pulisce il contesto e ripristina la qualità |
| `/refresh resume` | Ricarica il riassunto e riprende da dove eri |

Il file di handoff viene salvato in:
- **Windows:** `%USERPROFILE%\.claude\handoffs\latest.md`
- **macOS / Linux:** `~/.claude/handoffs/latest.md`

Dettagli completi nel [README](README.md).

---

## Disinstallare

Cancella semplicemente la cartella:
- **Windows:** `%USERPROFILE%\.claude\skills\refresh`
- **macOS / Linux:** `~/.claude/skills/refresh`
