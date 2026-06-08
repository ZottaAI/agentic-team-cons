# The Roster

Each role is a Claude Code subagent in `.claude/agents/`. Delivery agents have
write access to the engagement workpapers. Governance agents are independent and
read-only over delivery work, they produce review artefacts, not edits to the work
they review. Specialist packs are advisory and plug into fieldwork and reporting.

## Delivery team

| Agent | File | Plays | Access |
|---|---|---|---|
| Engagement Conductor | `engagement-conductor.md` | Orchestrator. Drives the pipeline, routes through gates, owns the audit trail. | full |
| Engagement Manager | `engagement-manager.md` | Scopes, plans, runs the day-to-day, first-line review, clears notes. | read/write |
| Senior / In-Charge | `senior-consultant.md` | Risk assessment, controls testing, evidence, drafts findings + workpapers. | read/write |
| Analyst | `analyst.md` | Data gathering, sampling, documentation, formatting. | read/write |

## Governance & review chain (the checks)

| Agent | File | Owns gate | Independent of delivery? |
|---|---|---|---|
| QRM / Independence | `qrm-independence.md` | G0 Acceptance | Yes |
| Technical Reviewer | `technical-reviewer.md` | G3 (technical lens) | Yes |
| EQCR | `eqcr.md` | G3 (independent challenge) | Yes, mandatory independence |
| Methodology / Quality | `methodology-quality.md` | G3 (documentation + evidence lens) | Yes |
| Partner Sign-off | `partner-signoff.md` | G4 Sign-off (assembles pack only) | n/a — prepares, never signs |
| Knowledge / Precedent | `knowledge.md` | none — retrieval | read-only |

## Service-line packs (swappable specialists)

In `.claude/agents/packs/`. Add or remove freely. Each plugs into `/fieldwork` and `/report`.

| Pack | File | Domain anchor |
|---|---|---|
| Internal Audit | `packs/internal-audit.md` | IIA Global Internal Audit Standards 2024, Three Lines Model |
| Controls / SOX / ICFR | `packs/controls-sox.md` | COSO 2013, ITGC, PCAOB AS 2201 concepts |
| Regulatory & Compliance | `packs/regulatory-compliance.md` | FCA Handbook, PRA Rulebook, SMCR |
| Cyber & Technology Risk | `packs/cyber-tech-risk.md` | NIST CSF 2.0, ISO 27001, CIS Controls |
| Financial Crime / AML | `packs/financial-crime.md` | MLR 2017, JMLSG, FCA FCG |
| Operational Resilience | `packs/op-resilience.md` | PRA SS1/21, FCA PS21/3, important business services |
| Data & Privacy | `packs/data-privacy.md` | UK GDPR, DPA 2018, ICO guidance |
| Third-Party / EERM | `packs/tprm.md` | PRA SS2/21 outsourcing, EBA guidelines |

## Addressing

- The Conductor is the only agent the user normally talks to. It dispatches the rest.
- Governance agents are invoked by gate skills, not by delivery agents. This keeps the
  reviewer independent of the reviewed, which is the entire point of a review chain.
- A specialist pack is pulled in when `/scope` tags the engagement with its service line.

## Independence rule (applies to every agent)

No agent may both perform delivery work and review that same work. The EQCR and
Technical Reviewer must be independent of the delivery team. The Partner Sign-off
agent assembles the pack and challenges it but does not approve. Approval is a named
human action, logged.
