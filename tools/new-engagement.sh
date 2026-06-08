#!/usr/bin/env bash
# Scaffold a new engagement working folder with the standard skeleton.
# Usage: tools/new-engagement.sh "<client>" "<engagement type>"
# Produces engagements/<ref>/ with an empty gate-log and copies of the key templates.
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "usage: $0 \"<client>\" \"<engagement type>\"" >&2
  exit 1
fi

CLIENT="$1"; TYPE="$2"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

slug() { printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//; s/-$//'; }
DATE="$(date -u +%Y%m%d)"
REF="$(slug "$CLIENT")-$(slug "$TYPE")-$DATE"
DIR="$ROOT/engagements/$REF"

if [ -d "$DIR" ]; then
  echo "error: engagement '$REF' already exists" >&2
  exit 1
fi

mkdir -p "$DIR/workpapers" "$DIR/evidence"
: > "$DIR/gate-log.jsonl"

cp "$ROOT/templates/acceptance-memo.md"   "$DIR/acceptance-memo.md"
cp "$ROOT/templates/engagement-plan.md"   "$DIR/engagement-plan.md"
cp "$ROOT/templates/racm.csv"             "$DIR/racm.csv"
cp "$ROOT/templates/findings-register.csv" "$DIR/findings-register.csv"
cp "$ROOT/templates/review-notes.md"      "$DIR/review-notes.md"
cp "$ROOT/templates/eqr-challenge-log.md" "$DIR/eqr-challenge-log.md"
cp "$ROOT/templates/report-shell.md"      "$DIR/report.md"
cp "$ROOT/templates/signoff-pack.md"      "$DIR/signoff-pack.md"
cp "$ROOT/templates/close-memo.md"        "$DIR/close-memo.md"

cat > "$DIR/README.md" <<EOF
# Engagement $REF
- Client: $CLIENT
- Type: $TYPE
- Created (UTC): $(date -u +%Y-%m-%dT%H:%M:%SZ)

Working file. ACCESS-CONTROLLED. Not committed to the public template repo (see /.gitignore).
Start with /accept (gate G0). The gate-log.jsonl is the defensibility record.
EOF

echo "created engagement: $REF"
echo "  -> $DIR"
echo "next: run /accept to open gate G0"
