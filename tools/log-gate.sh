#!/usr/bin/env bash
# Append a gate decision to an engagement's audit trail.
# Usage: tools/log-gate.sh <ref> <gate> <decision> "<rationale>" "<human_name>"
#   <gate>     one of G0 G1 G2 G3 G4 CLOSE (or a custom marker)
#   <decision> pass | fail | done | return
# The gate-log.jsonl is the engagement's defensibility record. Treat it as a primary output.
set -euo pipefail

if [ "$#" -lt 5 ]; then
  echo "usage: $0 <ref> <gate> <decision> \"<rationale>\" \"<human_name>\"" >&2
  exit 1
fi

REF="$1"; GATE="$2"; DECISION="$3"; RATIONALE="$4"; HUMAN="$5"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIR="$ROOT/engagements/$REF"
LOG="$DIR/gate-log.jsonl"

if [ ! -d "$DIR" ]; then
  echo "error: engagement '$REF' not found at $DIR (run tools/new-engagement.sh first)" >&2
  exit 1
fi

TS="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
# Escape double quotes and backslashes in free-text fields.
esc() { printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'; }

printf '{"ts":"%s","ref":"%s","gate":"%s","decision":"%s","rationale":"%s","confirmed_by":"%s"}\n' \
  "$TS" "$(esc "$REF")" "$(esc "$GATE")" "$(esc "$DECISION")" "$(esc "$RATIONALE")" "$(esc "$HUMAN")" \
  >> "$LOG"

echo "logged: $GATE $DECISION for $REF (by $HUMAN) -> $LOG"
