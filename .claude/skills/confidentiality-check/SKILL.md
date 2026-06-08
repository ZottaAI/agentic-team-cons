---
name: confidentiality-check
description: Always-on, BLOCKING data-handling gate. Runs before any client data is sent to a model or leaves the controlled environment. Classifies the data, enforces the approved-tooling list, and requires redaction or anonymisation of PII / MNPI / client-confidential material. A failure halts the action. Owner: qrm-independence agent (data-handling remit).
---

# /confidentiality-check — always-on (BLOCKING)

Run before any stage or action that would send client data to a model or outside the controlled
environment. This is non-negotiable in a regulated practice.

## Steps
1. **Classify** the data: public / internal / client-confidential / PII / MNPI (material non-public
   information) / SAR-or-equivalent highly sensitive.
2. **Check the tooling**: is the target model/tool on the firm's approved list for that
   classification? Realistically this means the firm's own GenAI platform, not a public model, for
   anything above "internal."
3. **Minimise and redact**: send the least data needed. Redact or anonymise PII and MNPI. Use
   synthetic or illustrative data where possible.
4. **Tipping-off and barriers**: for financial-crime and conflict-sensitive work, confirm no
   tipping-off risk and that information barriers are respected.

## Output
Pass / fail with the classification and the handling decision recorded. On fail, the action does not
proceed; propose a compliant alternative (redaction, approved tooling, synthetic data).

## Hard rules
- No client-confidential data, PII, or MNPI to an unapproved model. Ever.
- "It would be faster" is not a reason to bypass this. A confidentiality breach can end the engagement
  and the client relationship.
- When unsure of the classification, treat it as the more sensitive class.
