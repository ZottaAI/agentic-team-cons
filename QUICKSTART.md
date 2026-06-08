# Quickstart — run an engagement in 10 minutes

This walks a real (synthetic) engagement through all five gates so you can see what each
skill does and what it produces. The finished file lives in
[`examples/northwind-ia-procurement/`](examples/northwind-ia-procurement/) — open it alongside
this walkthrough.

> **The engagement:** an internal audit of procurement and supplier-payment controls at
> *Northwind Building Society* (a fictional UK PRA/FCA-regulated retail lender). Rated
> **heightened** risk because of a prior-year finding plus a payment-fraud near-miss, which makes
> the EQCR mandatory. All data is invented.

## 0. Open the repo in Claude Code

```bash
git clone https://github.com/ZottaAI/agentic-team-cons.git
cd agentic-team-cons
claude     # or open the folder in the Claude Code IDE extension
```

The agents in `.claude/agents/` and skills in `.claude/skills/` load automatically. Read
`ENGAGEMENT.md` once — it is the contract the whole team enforces.

## 1. Start the engagement

```
/engagement "Internal audit of procurement and supplier-payment controls, Northwind Building Society"
```

The **Engagement Conductor** assigns a reference and scaffolds the working folder:

```bash
tools/new-engagement.sh "Northwind Building Society" "IA Procurement"
# -> engagements/northwind-building-society-ia-procurement-YYYYMMDD/
#    with blank templates + an empty gate-log.jsonl
```

It then opens **Gate G0** and dispatches QRM. It will NOT go further until a human confirms.

## 2. G0 — Acceptance  ( /accept )

The **QRM / Independence** agent produces the acceptance memo: independence and conflicts cleared,
client AML/KYC and integrity checked, competence confirmed, and an engagement risk rating set.
Here it rates the engagement **heightened** (prior-year finding + fraud near-miss) and flags that an
**EQCR is required**.

➡ See [`acceptance-memo.md`](examples/northwind-ia-procurement/acceptance-memo.md).

**You (a named risk partner) confirm GO.** That is the first human gate. It gets logged:

```bash
tools/log-gate.sh <ref> G0 pass "independence clear; heightened risk; EQCR required" "P. Adeyemi (Risk Partner)"
```

## 3. G1 — Planning  ( /scope then /plan-fieldwork )

The **Engagement Manager** writes the plan (objectives, scope in/out, deliverables, resourcing) and
tags the engagement `internal-audit`, which pulls in the **Internal Audit pack**. Then the programme:
risks → controls → tests → evidence, captured as a RACM.

➡ See [`engagement-plan.md`](examples/northwind-ia-procurement/engagement-plan.md) and
[`racm.csv`](examples/northwind-ia-procurement/racm.csv).

Sample sizes are documented, not guessed:

```bash
tools/sample.py judgemental --frequency per-transaction --risk high   # -> 60
```

Manager approves the programme → **G1 logged**.

## 4. Fieldwork  ( /fieldwork )

`/confidentiality-check` runs first (no client data to an unapproved model). Then the
**Senior** and **Analyst**, with the IA pack, execute each test, document workpapers to standard, and
raise observations into the findings register. This run surfaces three:

| ID | Rating | Issue |
|----|--------|-------|
| F-01 | High | Dual-authorisation bypassed on 6/30 "urgent" manual payments |
| F-02 | Medium | Three-way-match overridden with blank justification on 9% of invoices |
| F-03 | Low | Supplier bank-detail changes lacked evidence of independent verification |

➡ See [`findings-register.csv`](examples/northwind-ia-procurement/findings-register.csv).

## 5. G2 — Manager review  ( /review )

The Manager reviews every workpaper, raises review notes, and clears them only on real resolution.
➡ See [`review-notes.md`](examples/northwind-ia-procurement/review-notes.md). All notes cleared → **G2 logged**.

## 6. G3 — Quality  ( /quality-check, BLOCKING )

Three INDEPENDENT reviewers run in parallel, none of whom did the work:

- **EQCR** independently challenges the significant judgements (e.g. is F-01 really High? is the root
  cause the urgent-payment path?). ➡ [`eqr-challenge-log.md`](examples/northwind-ia-procurement/eqr-challenge-log.md)
- **Technical Reviewer** checks accuracy against IIA 2024 and the control framework.
- **Methodology / Quality** checks the file is complete and re-performable, and that the gate-log is intact.

All three must pass. They do → **G3 logged** by the EQ reviewer.

## 7. Report  ( /report )

The Senior drafts the deliverable: executive summary tied to the objectives, the findings with
management responses, and an overall conclusion that follows from the body.
➡ See [`report.md`](examples/northwind-ia-procurement/report.md).

## 8. G4 — Sign-off  ( /signoff, human-only )

The **Partner Sign-off** agent assembles the pack (scope vs delivered, residual risk, EQR clearance,
open items, independence reconfirmed) and stress-tests it. ➡ [`signoff-pack.md`](examples/northwind-ia-procurement/signoff-pack.md)

**The AI does not sign.** A named human partner approves, and it is logged:

```bash
tools/log-gate.sh <ref> G4 pass "conclusion supported; EQR cleared; independence reconfirmed" "P. Adeyemi (Partner)"
```

## 9. Close  ( /close )

Issue, archive, lessons learned, continuance note. ➡ [`close-memo.md`](examples/northwind-ia-procurement/close-memo.md).

## The point of all this: the audit trail

Every gate decision is one line in `gate-log.jsonl`. This is the defensibility record — the thing you
hand an FRC/AQR inspector, and the reason a firm runs AI through this template instead of ad hoc.

➡ See [`gate-log.jsonl`](examples/northwind-ia-procurement/gate-log.jsonl):

```json
{"ts":"2026-05-12T09:15:00Z","gate":"G0","decision":"pass","confirmed_by":"P. Adeyemi (Risk Partner)", ...}
{"ts":"2026-05-14T16:40:00Z","gate":"G1","decision":"pass","confirmed_by":"S. Okafor (Manager)", ...}
{"ts":"2026-05-28T11:05:00Z","gate":"G2","decision":"pass","confirmed_by":"S. Okafor (Manager)", ...}
{"ts":"2026-06-03T15:20:00Z","gate":"G3","decision":"pass","confirmed_by":"R. Mensah (EQ Reviewer)", ...}
{"ts":"2026-06-06T10:00:00Z","gate":"G4","decision":"pass","confirmed_by":"P. Adeyemi (Partner)", ...}
{"ts":"2026-06-06T17:30:00Z","gate":"CLOSE","decision":"done","confirmed_by":"S. Okafor (Manager)", ...}
```

## Adapt it
- **Different service line?** Tag the engagement at `/scope` (e.g. `op-resilience`) — a different pack plugs in. No other change.
- **Your methodology?** Point `standards/` and `.claude/memory/` at your firm's sources.
- **Tighten a gate?** Edit that gate's skill in `.claude/skills/`. The gates are the contract.
