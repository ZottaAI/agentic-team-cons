# EQR Challenge Log (Gate G3 — EQCR)

- **Engagement ref:** NBS-IA-26-014     **EQCR:** R. Mensah (independent; not on prior-year team)     **Date:** 2026-06-03
- **Engagement risk rating:** heightened   (EQCR mandatory)

| # | Significant judgement / conclusion | EQCR challenge | Team response | Disposition |
|---|---|---|---|---|
| 1 | F-01 rated High | Is High defensible with no confirmed financial loss? Could this be Medium? | Likelihood is high (live, exploitable, single-approver releases observed) and it is the exact mechanism of the Q1 near-miss; impact is material. High is appropriate even absent a realised loss. Evidence: WP-C04, near-miss incident record. | Satisfied |
| 2 | Root cause of F-01 = "urgent path does not enforce dual auth" | Have you ruled out that approvers were simply not following an existing system control? | Walkthrough WP-C04-wt confirms the urgent workflow has no second-approver step to follow; it is a design gap, not non-compliance with an existing control. | Satisfied |
| 3 | Overall conclusion = "partial assurance" | Does one High finding warrant only "partial" rather than "limited/no" assurance? | Standard controls (C-01, C-02 core match) operate effectively; the High is contained to the urgent path with a defined interim mitigation agreed. Partial (not limited) is supported by the balance of evidence. | Satisfied |
| 4 | Sufficiency of urgent-path sample (30 of 96) | Is 30 enough to conclude on a heightened-risk path? | Sample is targeted: all urgent payments > 25k tested 100% plus a judgemental sample of the remainder; coverage rationale at WP-C04-sample. | Satisfied |

## Overall
- Does the headline conclusion follow from the body of work? Yes — see disposition of items 1 and 3.
- Was contrary evidence sought and dealt with? Yes — the no-loss follow-up (item 1) and the
  non-compliance hypothesis (item 2) were both tested and addressed.
- Any objectivity concern? No. In-charge rotated this year per the acceptance safeguard.
- **G3-EQCR status:** PASS (all items Satisfied).

> Logged with technical + methodology: G3 pass — "EQCR satisfied; technical clean; methodology complete" — R. Mensah (EQ Reviewer)
