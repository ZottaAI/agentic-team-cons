---
name: independence-check
description: Always-on, BLOCKING independence and conflicts check. Callable at any stage. Confirms the firm and individuals are independent and free of conflicts, and re-runs whenever a new relationship, scope change, or finding could create an independence or self-review threat. A breach halts the engagement. Owner: qrm-independence agent.
---

# /independence-check — always-on (BLOCKING)

Dispatch the **qrm-independence** agent. Run at acceptance, at sign-off, and any time something
changes that could create a threat.

## Test for
- Financial, business, employment, or family relationships with the client.
- Self-review threat: would the firm be reviewing or assuring something it effectively built, advised,
  or decided? This is the most common trap in advisory-then-assurance situations.
- Self-interest, advocacy, familiarity, and intimidation threats.
- Conflicts with other clients or matters, and whether information barriers are adequate.
- For audit clients: prohibited non-audit service combinations under the FRC Ethical Standard, with a
  higher bar for Public Interest Entities.

## Output
A clear independent / not-independent / independent-with-safeguards conclusion, with the
threats-and-safeguards reasoning documented (the reasoning is what an inspector tests).

## Hard rules
- A breach or unmitigated threat HALTS the engagement until resolved. This overrides delivery and timeline.
- Document reasoning, not just the conclusion.
- When in doubt, escalate via `/escalate` to QRM / national office rather than self-clearing.
