---
name: signoff
description: Gate G4 — partner sign-off. Assembles the sign-off pack (scope vs delivered, key judgements, residual risk, EQR clearance, quality-gate status, open items, independence reconfirmation), stress-tests it, and presents it to a named human partner who approves. BLOCKING and human-only. The AI assembles and challenges; it never signs. Owner: partner-signoff agent (assembles), human partner (approves).
---

# /signoff — the sign-off gate (G4, human-only)

Dispatch the **partner-signoff** agent to assemble `engagements/{ref}/signoff-pack.md` from
`templates/signoff-pack.md`. First confirm `/independence-check` is reconfirmed as at today.

## Pack contents
- Scope vs. delivered, including any scope limitations or changes.
- Key judgements and conclusions, with why they hold.
- Residual risk: what remains, what is out of scope, what the client must own.
- EQR clearance: the challenge log, all items resolved/satisfied. If not, you cannot proceed.
- Quality-gate status: technical, EQCR, methodology all passed at G3.
- Open items, with owner and date.
- Independence reconfirmation from QRM as at the sign-off date.

## The agent's challenge
Before presenting, pressure-test the pack: is the headline supported, is anything material buried, is
any open item really a blocker? Surface these explicitly to the partner.

## The decision (human only)
**STOP.** The named human partner reviews and approves. The AI does not approve. Record:
`tools/log-gate.sh {ref} G4 pass "<partner rationale>" "<partner name>"`.

## Hard rules
- Incomplete EQR clearance, an unpassed quality gate, or unconfirmed independence means no "ready to
  sign" pack. Return it to the open gate.
- Do not compress the pack under time pressure. An unreadable pack produces an uninformed signature.
