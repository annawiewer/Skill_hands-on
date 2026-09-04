# Awesome Copilot Discovery Snapshot

This fallback captures relevant results visible in the public Awesome Copilot skills catalog for the search term `incident` on September 4, 2026. Live results can change as the repository evolves.

## Relevant skills

| Skill | Intended outcome | Fit for this workshop |
| --- | --- | --- |
| `aws-cloudwatch-investigation` | Investigate AWS CloudWatch signals during incident triage | Too platform-specific and focused on investigation |
| `bug-receipt` | Close defects and incidents with a verification status | Focused on closure rather than shift transfer |
| `incident-postmortem` | Write a structured, blameless retrospective after resolution | Closest candidate, but runs at the wrong workflow stage |
| `shopify-review-triage` | Triage public Shopify reviews into a product or support brief | Different data source and outcome |

## Expected decision

Create a new `incident-handoff` skill.

The new skill is needed during an active incident. It transfers verified facts, current impact, mitigation state, ownership, open questions, and next actions to the incoming responder. A post-mortem instead reconstructs and analyzes the incident after resolution.

## Important limitation

This snapshot is a workshop fallback, not a substitute for a live search in normal work. Always search current sources before creating a reusable customization.
