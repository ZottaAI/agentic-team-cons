# Firm knowledge base

This is where the `knowledge` agent (via `/precedent` and `/reg-update`) reads from. Populate it
with material your firm is allowed to reuse:

- **precedents/** — anonymised approaches, programmes, and lessons-learned from prior engagements,
  by engagement type and sector. No other client's confidential data; anonymised patterns only.
- **methodology/** — your firm's internal methodology references and manuals.
- **reg-library/** — current regulatory extracts and supervisory publications relevant to your scopes.
- **templates-firm/** — firm-specific document templates that extend the generic ones in `/templates`.

## Rules
- Respect information barriers. Anonymise precedent. Never store one client's confidential data where
  another engagement could read it.
- Keep the reg-library current and dated. Stale regulatory material is a risk, not an asset.
- This folder is reference for the agents. Per-engagement working papers live in `/engagements`.
