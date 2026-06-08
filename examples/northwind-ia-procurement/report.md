# Internal Audit — Procurement & Supplier-Payment Controls

- **Client:** Northwind Building Society     **Engagement ref:** NBS-IA-26-014
- **Date:** 2026-06-06     **Classification:** Client-confidential
- **Distribution:** Board Audit Committee; CFO; Head of Internal Audit
- **Status:** Final (signed off 2026-06-06)

## Overall opinion
**Partial assurance.** Core procurement and payment controls (standard-path dual authorisation and
the automated three-way match) are designed and operating effectively. However, a significant control
gap exists on the **urgent / manual payment path**, the same mechanism implicated in the Q1 2026
payment-fraud near-miss, together with two lower-rated weaknesses in override governance and supplier
bank-detail verification.

## Scope and approach
We assessed the design and operating effectiveness of controls across supplier onboarding and
master-data changes, three-way match, payment authorisation (including the urgent path), and payment
release, for the period 2025-10-01 to 2026-04-30. Work followed the IIA Global Internal Audit
Standards (2024). Payroll, treasury, and the GL close were out of scope. One retired legacy payment
queue was assessed for design only.

## Findings
### F-01 — Dual authorisation bypassed on the urgent-payment path  ·  Rating: High
- **Condition:** 6 of 30 sampled urgent payments (including 2 over £25k) were released with a single approver.
- **Criteria:** payments over £25k require two authorisers (Authorisation Matrix v4).
- **Cause:** the urgent workflow does not system-enforce a second authoriser; it relies on manual discipline.
- **Consequence:** unauthorised or fraudulent payments can be released; this is the gap implicated in the Q1 near-miss.
- **Recommendation:** system-enforce dual authorisation on the urgent path with no manual override; reconcile urgent payments daily to approvals.
- **Management response:** Agreed. System control to be configured by 2026-08-31; interim daily reconciliation from 2026-06-09. Owner: Financial Controller.

### F-02 — Three-way-match override permitted without justification  ·  Rating: Medium
- **Condition:** override reason was blank for 9% of overridden invoices; override usage is not monitored.
- **Criteria:** overrides should be justified and monitored (firm policy FIN-07).
- **Cause:** the override reason field is not mandatory and no exception report is reviewed.
- **Consequence:** inaccurate or duplicate payments may pass undetected; reliance on the match is overstated.
- **Recommendation:** make the override reason mandatory; introduce a monthly review of overrides.
- **Management response:** Agreed. Mandatory field by 2026-07-15; monthly review from July. Owner: AP Lead.

### F-03 — Supplier bank-detail changes not consistently verified  ·  Rating: Low
- **Condition:** 3 of 20 sampled bank-detail changes had no evidence of independent verification.
- **Criteria:** bank-detail changes require maker-checker verification before activation.
- **Cause:** manual process; the second check is not enforced or evidenced.
- **Consequence:** payments could be diverted to fraudulent accounts. (All three traced to genuine suppliers; no loss.)
- **Recommendation:** enforce and evidence maker-checker within the supplier master workflow.
- **Management response:** Agreed. Workflow change scheduled by 2026-09-30. Owner: Procurement Lead.

## Conclusion
The standard control environment is sound, but the urgent-payment path is a live, exploitable gap that
should be closed as a priority; the interim daily reconciliation is a reasonable short-term mitigation.
Closing F-01 to F-03 would move the process toward full assurance at the next review.

## Appendix
Scope detail, methodology, and the evidence summary are retained in the engagement file (workpapers
WP-C01 to WP-C04, WP-DA-01/02). Every statement above traces to a workpaper.
