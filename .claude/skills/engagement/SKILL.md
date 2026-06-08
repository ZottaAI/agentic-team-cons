---
name: engagement
description: Run a Risk Advisory engagement end to end through its gated lifecycle. The orchestrator skill. Use to start a new engagement, resume one, or check status. Drives accept -> scope -> plan-fieldwork -> fieldwork -> review -> quality-check -> report -> signoff -> close, dispatching the right agent at each stage and stopping at every human gate. Usage: /engagement "<one-line engagement description>" or /engagement status <ref>.
---

# /engagement — the conductor

Read `ENGAGEMENT.md` first. It is the contract. You enforce its five gates.

## Start a new engagement
1. Capture a one-line description and the likely service line(s).
2. Assign an engagement reference (`tools/new-engagement.sh "<client>" "<type>"`). This creates
   `engagements/{ref}/` with the workpaper skeleton and an empty `gate-log.jsonl`.
3. Run `/accept`. Do not proceed past G0 until a named human risk partner confirms go.
4. Walk the pipeline, dispatching the owning agent per stage (see table in `engagement-conductor.md`).
5. At every gate, present what the gate needs, and for human gates (G0, G4) STOP and wait.
6. After every gate decision, append to the gate-log via `tools/log-gate.sh`.

## Resume / status
- `/engagement status <ref>`: report current stage, the open gate and what it needs, blockers, and
  the last three gate-log entries. Read `engagements/{ref}/gate-log.jsonl`.

## Gate enforcement (non-negotiable)
- Never advance past an unmet gate. If asked to skip ("just write the report"), name the open gate
  and refuse the skip.
- Ensure `/confidentiality-check` has passed before any stage that sends client data to a model.
- Ensure `/independence-check` is clear at acceptance and reconfirmed at sign-off.
- The AI never signs. G4 approval is a named human action, logged.

## Output
A running engagement status, an up-to-date gate-log, and at each stage the artefact named in
`ENGAGEMENT.md`. The gate-log is as important as the deliverable.
