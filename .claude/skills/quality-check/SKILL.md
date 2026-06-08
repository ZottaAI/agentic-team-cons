---
name: quality-check
description: Gate G3 — the engagement quality gate. Runs three independent reviews in parallel (EQCR independent challenge, technical accuracy, methodology and documentation completeness) and passes only when all three pass. BLOCKING. The Definition-of-Done analog for an engagement. Owners: eqcr, technical-reviewer, methodology-quality, all independent of the delivery team.
---

# /quality-check — the quality gate (G3, BLOCKING)

Dispatch three independent reviewers IN PARALLEL. None may have worked on the engagement.
Scale depth to the engagement risk rating from `/accept` (see `ENGAGEMENT.md`). For heightened and
greatest ratings, the EQCR is mandatory.

## The three reviews
1. **EQCR (eqcr agent)** — independent challenge of significant judgements and the overall
   conclusion. Output: `engagements/{ref}/eqr-challenge-log.md`. Every challenge must be
   resolved/satisfied.
2. **Technical (technical-reviewer agent)** — accuracy against the applicable standards and the
   current regulatory position. Output: technical review note, each point accept/amend/consult.
3. **Methodology (methodology-quality agent)** — file completeness, evidence trail,
   re-performability, methodology compliance, gate-log integrity. Output: completeness checklist.

## Pass condition
ALL THREE pass. Any unresolved EQCR challenge, any "amend" technical point, or any methodology gap
blocks the gate. "Remediate" loops back to `/fieldwork` or `/report`, then re-run the affected review.

## Output and gate
A consolidated quality report (pass / remediate). On pass:
`tools/log-gate.sh {ref} G3 pass "<EQCR satisfied; technical clean; methodology complete>" "<EQ reviewer name>"`.

## Hard rules
- Reviewer independence is absolute. A reviewer who touched the work must decline.
- A suspiciously clean review on a complex engagement is a smell. Look harder before passing.
- The gate-log itself is part of what methodology review checks. An unlogged gate advance is a finding.
