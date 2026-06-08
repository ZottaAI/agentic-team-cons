---
name: close
description: Close the engagement after sign-off. Issues the deliverable, archives the workpapers per the retention policy, captures lessons learned, records client feedback, and writes the continuance note for next time. Owner: engagement-manager.
---

# /close — issue, archive, learn

Run only after G4 sign-off. Dispatch the **engagement-manager**. Produce
`engagements/{ref}/close-memo.md` from `templates/close-memo.md`.

## Steps
1. **Issue** the signed deliverable to the client per the agreed channel. Record issue date.
2. **Archive**: assemble the final file (workpapers, gate-log, reviews, sign-off pack) and mark it for
   retention per policy. Confirm client data is handled to the confidentiality standard.
3. **Lessons learned**: what went well, what to change, what was contentious. Write it so the next team
   benefits. Feed it into `.claude/memory/` for `/precedent`.
4. **Client feedback**: capture it.
5. **Continuance note**: anything relevant to accepting the next engagement with this client (issues,
   risk signals, relationship notes). This feeds the next `/accept`.

## Output
Closed engagement: issued deliverable, archived file, lessons-learned and continuance notes in memory.
Log: `tools/log-gate.sh {ref} CLOSE done "<issued and archived>" "<manager name>"`.

## Hard rules
- The archived file must include the complete gate-log. It is the engagement's defensibility record.
- Lessons learned are only valuable if written for the next team and actually stored in memory.
