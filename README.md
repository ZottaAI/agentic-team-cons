# Risk Advisory Team — an AI engagement crew with the checks built in

A reusable Claude Code skill collection that mirrors how a Risk Advisory engagement
actually runs: a delivery team, service-line specialists, and the internal review
chain (acceptance, independence, manager review, EQCR, partner sign-off). It drives
an engagement through gated stages and keeps an audit trail of who-reviewed-what.

**It is a template and accelerator, not an autonomous delivery machine.** AI drafts,
tests, challenges, and assembles. Humans decide and sign. The AI never signs off.

---

## Start here (if you work in Risk Advisory)

You drive the whole thing with one command. Open the repo in Claude Code and type:

```
/engagement "Internal audit of procurement controls, ClientCo"
```

The Engagement Conductor scaffolds the working file and walks you through the lifecycle, dispatching
the right specialist at each stage and **stopping at every human gate** (you confirm acceptance and
you sign off; the AI never does). You are the partner-in-charge; the agents are your team.

- **New to it?** Read [`QUICKSTART.md`](QUICKSTART.md) and the fully worked example in
  [`examples/northwind-ia-procurement/`](examples/northwind-ia-procurement/) first. It is a complete
  synthetic engagement, all five gates, with the audit trail.
- **Just need one check, not a whole engagement?** Run a single skill, e.g. `/independence-check`,
  `/confidentiality-check`, `/quality-check`, or `/reg-update`.
- **Resuming or checking status?** `/engagement status <ref>`.

---

## What's in here

```
risk-advisory-team/
  README.md            <- you are here
  AGENTS.md            <- the roster + how to address each agent
  ENGAGEMENT.md        <- the methodology spine: stages, gates, artefacts
  .claude/
    agents/            <- one file per role (delivery + governance + packs/)
    skills/            <- one folder per slash-command skill
    memory/            <- firm knowledge, precedents, reg library (you fill this)
  engagements/         <- per-engagement workpapers (ACCESS-CONTROLLED, gitignored)
  templates/           <- RACM, findings register, report shell, sign-off pack...
  standards/           <- pointers to IIA / COSO / ISQM / FRC / PRA (you supply)
  tools/               <- helper scripts (gate logger, scaffolder, sampling)
```

## Quickstart

1. Drop this folder into a fresh repo (or use it as the repo root).
2. Read `ENGAGEMENT.md` end to end. It defines the five gates. Everything else serves them.
3. Fill `standards/` and `.claude/memory/` with your firm's actual methodology pointers.
   This template ships the *shape*, not proprietary methodology.
4. Start an engagement: `/engagement "Internal audit of procurement controls, ClientCo"`.
   The conductor walks you through acceptance → scope → fieldwork → quality → sign-off → close,
   stopping at every human gate.

## The five gates (the whole point)

| Gate | Skill | Passes when | Human signs? |
|---|---|---|---|
| G0 Acceptance | `/accept` | Independence + conflicts clear, client & engagement risk rated | Risk partner |
| G1 Planning | `/scope` + `/plan-fieldwork` | Scope + programme approved by Manager | Manager |
| G2 Fieldwork review | `/review` | Workpapers reviewed, notes cleared, evidence sufficient | Manager |
| G3 Quality | `/quality-check` | EQCR + technical + methodology all pass | EQ reviewer |
| G4 Sign-off | `/signoff` | Partner approves; independence reconfirmed | Partner |

Always-on, BLOCKING, at every stage: `/independence-check` and `/confidentiality-check`.

## Non-negotiables (read before you adapt anything)

- **AI never signs.** G3 and G4 are human decisions under FRC Ethical Standard, ISQM 1, ISQM 2.
- **No client data to an unapproved model.** `/confidentiality-check` gates every external call.
- **Independence is sacred.** Nothing here may imply AI performs a management function for an audit client.
- **Methodology is yours.** Point `standards/` at IIA 2024 / COSO / ISQM / FRC ES / PRA-FCA handbooks. Do not embed proprietary content.

## How to adapt

- **Add a service line:** drop a new file in `.claude/agents/packs/`. Nothing else changes.
- **Tighten a gate:** edit the gate's skill in `.claude/skills/`. Gates are the contract.
- **Change roles:** edit `.claude/agents/`. Keep the review chain intact, that is the moat.
