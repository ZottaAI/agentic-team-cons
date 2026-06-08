---
name: review
description: Gate G2 — first-line (manager) review of fieldwork. Reviews every workpaper, raises review notes, and clears them only on real resolution. Confirms evidence is sufficient and conclusions follow from it before the file goes to the independent quality gate. Owner: engagement-manager.
---

# /review — manager review (G2)

Dispatch the **engagement-manager**. Review the file in `engagements/{ref}/`. Record notes in
`engagements/{ref}/review-notes.md` from `templates/review-notes.md`.

## For each workpaper, test
1. Is the procedure described the procedure performed?
2. Is evidence attached, dated, sourced, and re-performable?
3. Does the conclusion follow from the evidence, or is it asserted?
4. Is the population defined and the sample justified?
5. Are exceptions evaluated, not just listed?

## Review notes
Raise a note for every gap. Clear a note only when the Senior resolves it with evidence, not with
"agreed" or "noted." Track open vs. cleared.

## Output and gate
The file is "reviewed" only when every note is cleared. Then G2 passes:
`tools/log-gate.sh {ref} G2 pass "<notes cleared: N>" "<manager name>"`.

## Hard rules
- You are first-line review, not the EQCR. Make the file good; do not pre-empt the independent challenge.
- Never advance to `/quality-check` with open review notes.
