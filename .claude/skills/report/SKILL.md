---
name: report
description: Draft the engagement deliverable after the quality gate passes. Produces the report or opinion, the findings register with ratings, recommendations and management responses, and an audit-committee-ready summary. Owner: senior-consultant with the relevant service-line pack; reviewed by the engagement-manager.
---

# /report — the deliverable

Only run after G3 (`/quality-check`) has passed. Dispatch the **senior-consultant** with the tagged
pack. Produce `engagements/{ref}/report.md` from `templates/report-shell.md`.

## Structure
1. **Executive summary**: the conclusion / opinion, tied directly to the objectives, in language an
   audit committee can act on.
2. **Scope and approach**: what was done and what was not (carry the scope limitations forward).
3. **Findings**: each as condition / criteria / cause / consequence / recommendation, with a rating
   and the management response and remediation owner and date.
4. **Overall conclusion**: follows from the body. Nothing material introduced only in the summary,
   nothing material buried only in an appendix.

## Discipline
- Every statement in the report traces to a workpaper. No new conclusions at reporting time that the
  file does not support, if you find one, it goes back through review and quality.
- Ratings consistent with the methodology and applied evenly.
- Get management responses before issue; an unanswered finding is an open item for sign-off.

## Output
Draft deliverable + completed findings register. Feeds `/signoff` (G4). Manager reviews the draft
before it reaches the partner pack.
