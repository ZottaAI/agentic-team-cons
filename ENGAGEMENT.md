# The Engagement Spine

This is the contract. Every skill and agent serves it. An engagement is the unit of
work. It flows through stages. Each stage has an entry gate. A gate is a checkpoint
that blocks progress until a defined condition is met and (for human gates) a named
person has confirmed it.

## Lifecycle

```
  pursuit (optional)
        |
   [G0] /accept ............ acceptance memo + go/no-go
        |
   [G1] /scope ............. engagement plan + letter/SoW
        /plan-fieldwork .... risk programme / RACM
        |
        /fieldwork ......... workpapers, evidence, observations
        |
   [G2] /review ........... manager review notes cleared
        |
   [G3] /quality-check .... EQCR + technical + methodology  (BLOCKING)
        |
        /report ........... draft deliverable + findings register
        |
   [G4] /signoff .......... partner sign-off pack -> HUMAN APPROVES  (BLOCKING)
        |
        /close ............ issue, archive, lessons learned
```

Always-on at every stage: `/independence-check`, `/confidentiality-check`. A breach
halts the engagement no matter where it is.

## The five gates in detail

### G0 — Acceptance  (skill: `/accept`, owner: QRM / Independence)
Passes only when ALL are true:
- Independence confirmed (firm-level and individual), conflicts cleared.
- Client acceptance: AML/KYC on the client, integrity, reputational risk acceptable.
- Engagement risk rated (e.g. normal / heightened / greatest). Rating drives whether EQCR is required.
- Scope is something the firm is competent and resourced to deliver.
- An engagement reference is assigned and the workpaper folder created.
Output: acceptance memo (`templates/acceptance-memo.md`) + recorded go/no-go.

### G1 — Planning  (skills: `/scope`, `/plan-fieldwork`, owner: Engagement Manager)
Passes only when:
- Objectives, scope boundaries, and the risk universe are documented and approved.
- Engagement letter / SoW drafted; deliverables, timeline, and responsibilities clear.
- A risk-and-control programme exists (RACM for controls work, audit programme for IA).
- Resourcing and milestones set.
Output: engagement plan + programme.

### G2 — Fieldwork review  (skill: `/review`, owner: Engagement Manager)
Passes only when:
- Every workpaper has been reviewed.
- All review notes are raised AND cleared.
- Evidence is sufficient and appropriate to support each observation.
- Conclusions follow from the evidence, not from assertion.
Output: cleared review-note log.

### G3 — Quality  (skill: `/quality-check`, owners: EQCR + Technical Reviewer + Methodology, BLOCKING)
Three independent reviews run in parallel and must all pass:
- **EQCR:** independent challenge of significant judgements and conclusions (ISQM 2 / ISA 220).
- **Technical:** accuracy against the applicable standards and the regulatory position.
- **Methodology / documentation:** workpaper completeness, evidence trail, methodology compliance.
Output: quality report (pass / remediate). Remediate loops back to fieldwork or report.

### G4 — Sign-off  (skill: `/signoff`, owner: Partner Sign-off agent assembles; HUMAN approves, BLOCKING)
The agent assembles the sign-off pack: scope vs. delivered, key judgements, residual risk,
EQR clearance, open items, independence reconfirmation. The named human partner approves.
**The AI does not approve.** Approval is logged with the partner's name, timestamp, and rationale.

## The audit trail

Every gate decision is appended to the engagement's `gate-log.jsonl` via
`tools/log-gate.sh`: gate id, decision, rationale, the human who confirmed it,
timestamp. This log is the defensibility artefact. It is the reason a firm adopts
this rather than letting people use AI ad hoc. Treat it as the primary output of the
governance layer, as important as the client deliverable.

## Engagement risk rating drives rigour

| Rating | EQCR required? | Technical review depth | Partner involvement |
|---|---|---|---|
| Normal | optional | standard | review + sign |
| Heightened | yes | deep, named SME | active throughout |
| Greatest | yes, senior EQR | deep + consultation | continuous, plus risk partner |

`/accept` sets this rating. `/quality-check` and `/signoff` read it and scale accordingly.

## Artefacts produced per engagement

| Stage | Artefact | Template |
|---|---|---|
| Accept | Acceptance memo | `templates/acceptance-memo.md` |
| Scope | Engagement plan | `templates/engagement-plan.md` |
| Plan fieldwork | RACM / audit programme | `templates/racm.csv` |
| Fieldwork | Workpapers, findings register | `templates/findings-register.csv` |
| Review | Review-note log | `templates/review-notes.md` |
| Quality | Quality report, EQR challenge log | `templates/eqr-challenge-log.md` |
| Report | Deliverable / report | `templates/report-shell.md` |
| Sign-off | Sign-off pack | `templates/signoff-pack.md` |
| Close | Lessons learned, continuance note | `templates/close-memo.md` |
