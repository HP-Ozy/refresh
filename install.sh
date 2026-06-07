set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude/skills/refresh"

echo "Installazione skill 'refresh'..."

if [ ! -f "$SRC/SKILL.md" ]; then
  echo "ERRORE: SKILL.md non trovato. Lancia lo script dalla cartella del progetto." >&2
  exit 1
fi

mkdir -p "$DEST"
cp "$SRC/SKILL.md"  "$DEST/"
cp "$SRC/README.md" "$DEST/"
[ -d "$SRC/evals" ] && cp -r "$SRC/evals" "$DEST/"

echo "Fatto. Skill installata in: $DEST"
echo "Apri (o riavvia) Claude Code e scrivi /refresh"
