---
name: fieldwork
description: Execute the programme. Gather evidence, perform tests, document workpapers to standard, and raise observations and findings. The service-line pack provides domain-correct procedures. Owners: senior-consultant and analyst, supervised by the engagement-manager, with the relevant pack.
---

# /fieldwork — do the work

Confirm `/confidentiality-check` has passed before sending any client data to a model. Dispatch the
**senior-consultant** (execution) and **analyst** (data, sampling, documentation), with the tagged pack.

## Steps
1. **Gather and reconcile** the populations and evidence (analyst). Reconcile before sampling.
2. **Execute each test** in the programme (senior): procedure as written, population defined, sample
   per basis, result recorded, exceptions evaluated (not just listed).
3. **Document each workpaper to standard**: objective, procedure performed, population and sample
   basis, evidence reference, result, exception evaluation, conclusion. Re-performable by a stranger.
4. **Raise observations** as findings in `engagements/{ref}/findings-register.csv`
   (`templates/findings-register.csv`): condition, criteria, cause, consequence, recommendation,
   rating, management-response placeholder.
5. Escalate contentious technical matters via `/escalate` rather than ruling on them in the file.

## Output
Completed workpapers + a findings register. Feeds `/review` (G2).

## Hard rules
- No conclusion without evidence. Insufficient evidence is a finding or a scope limitation, surface it.
- Source and date everything. A break that does not tie out is a signal, not something to "fix."
- No client data to an unapproved model. Use redacted or synthetic data to illustrate.
