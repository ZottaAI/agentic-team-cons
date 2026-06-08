---
name: accept
description: Gate G0 — Client and Engagement Acceptance and Continuance (CEAC). Runs independence and conflict checks, client AML/KYC and integrity assessment, competence and resourcing check, and engagement risk rating, then produces an acceptance memo and a go/no-go for a named human risk partner. BLOCKING — nothing starts until this passes. Owner: qrm-independence agent.
---

# /accept — the acceptance gate (G0)

Dispatch the **qrm-independence** agent. Produce `engagements/{ref}/acceptance-memo.md` from
`templates/acceptance-memo.md`. Clear every item; a single unresolved item blocks the gate.

## Checklist
1. **Independence** (firm and individual): financial / business / employment / family ties;
   prohibited service combinations if the client is an audit client; PIE? Apply FRC Ethical Standard.
2. **Conflicts**: with other clients or matters; information barriers needed?
3. **Client acceptance**: AML/KYC, beneficial ownership, integrity, reputation, sanctions / adverse
   media, ability and willingness to pay.
4. **Competence and resourcing**: can the firm deliver this well, with the right people, in time?
5. **Engagement risk rating**: normal / heightened / greatest. Record the drivers. This rating sets
   whether an EQCR is required and how deep technical review goes (see `ENGAGEMENT.md`).

## Output and decision
- Acceptance memo with a clear go / no-go recommendation and the threats-and-safeguards reasoning.
- **STOP for human confirmation.** A named risk partner confirms go/no-go.
- Log the decision: `tools/log-gate.sh {ref} G0 <pass|fail> "<rationale>" "<human name>"`.

## Hard rules
- A QRM "no" or "needs safeguards" is binding.
- Watch for self-review threats up front, especially where the firm previously advised the client.
- No engagement work begins before G0 passes.
