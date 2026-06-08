---
name: scope
description: Define the engagement scope and plan. Sets objectives, scope boundaries, the risk universe, deliverables, timeline, resourcing, and drafts the engagement letter / SoW. Tags the engagement with its service line(s) so the right specialist pack is pulled in. Part of gate G1 (planning). Owner: engagement-manager agent.
---

# /scope — define the work

Dispatch the **engagement-manager**. Produce `engagements/{ref}/engagement-plan.md` from
`templates/engagement-plan.md`.

## Steps
1. **Objectives**: what question is this engagement answering? State it so success is testable.
2. **Scope boundaries**: in scope, out of scope, and any scope limitations. Be explicit about what
   you are NOT doing, that prevents later disputes.
3. **Risk universe**: the risks the engagement addresses, traced to the client's business and risks.
4. **Service-line tagging**: tag with one or more of {internal-audit, controls-sox,
   regulatory-compliance, cyber-tech-risk, financial-crime, op-resilience, data-privacy, tprm}. This
   pulls the matching pack into planning and fieldwork.
5. **Deliverables, timeline, resourcing**: what is produced, when, by whom. Set milestones.
6. **Engagement letter / SoW**: draft it. Confirm responsibilities (client and firm) and dependencies.
7. Pull `/precedent` to learn from prior similar engagements before finalising.

## Output
Engagement plan + draft engagement letter. Feeds `/plan-fieldwork`. G1 passes after the programme
exists and the Manager approves (logged via `tools/log-gate.sh {ref} G1 ...`).

## Hard rules
- No fieldwork before G1. Scope first, then programme, then test.
- A vague objective produces an unfocused engagement. Push until it is testable.
