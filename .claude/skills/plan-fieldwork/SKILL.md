---
name: plan-fieldwork
description: Build the detailed risk-and-control programme that fieldwork will execute. Translates risks into controls into test procedures into evidence requests. Produces a RACM for controls work or an audit programme for internal audit. Completes gate G1 (planning). Owner: engagement-manager with the relevant service-line pack.
---

# /plan-fieldwork — the programme

Dispatch the **engagement-manager** and pull the tagged service-line pack. Produce the programme:
`engagements/{ref}/racm.csv` from `templates/racm.csv` (controls work) or an audit programme (IA).

## Steps
1. For each objective and risk, identify the control(s) that should address it.
2. For each control, define the test: procedure, population, sample basis, evidence required, and
   whether you are testing design, operating effectiveness, or both.
3. Sequence: walkthroughs and design confirmation before tests of operating effectiveness.
4. Size samples to control frequency and risk (use `tools/sample.py` to document the basis).
5. Specify evidence requests to the client (the PBC / prepared-by-client list).
6. Have the pack sanity-check the programme against what "good" looks like in that domain.

## Output
A complete programme tying objectives -> risks -> controls -> tests -> evidence. This is the spine of
fieldwork and of the eventual file. G1 passes when the Manager approves the programme:
`tools/log-gate.sh {ref} G1 pass "<rationale>" "<manager name>"`.

## Hard rules
- Every test must have a defined population and a documented sample basis. No "we looked at some."
- Do not test operating effectiveness of a control whose design you have not confirmed.
