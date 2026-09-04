---
name: incident-handoff
description: 'Create a concise shift handoff for an active production incident. Use when incident response changes shifts, ownership transfers to another responder, or someone asks for the current incident state and next actions. Preserve verified facts, label hypotheses, expose unknowns, and never treat the output as a resolved-incident post-mortem.'
argument-hint: 'Provide or identify the notes for the active incident.'
---

# Incident Handoff

Create an operational handoff that lets an incoming responder understand the current state and act without relying on undocumented context.

## Required input

Identify the source notes and the handoff cutoff time. Use only information available in those sources.

If the notes do not identify the incident, current status, severity, impact, mitigation state, or next actions, ask for the missing information or mark it as unknown. Do not infer it.

## Procedure

1. Extract incident identity, declared severity, current status, cutoff time, affected services or regions, observed impact, and communication commitments.
2. Classify every material statement as a confirmed fact, an unconfirmed hypothesis, or unknown information.
3. Build a current-state snapshot. State whether the incident is active, recovering, monitoring, or resolved only when the source explicitly supports that state.
4. Select only timeline events that explain the present state, mitigation, and remaining work.
5. Put next actions near the top. Preserve named owners and target times. Use `Unassigned` and `Not provided` when those values are missing.
6. List open questions and missing impact information explicitly.
7. Include the next communication commitment when one exists.
8. Validate the handoff against the completion checks before returning it.

## Decision rules

| Source statement | Treatment |
| --- | --- |
| Direct observation, alert, completed action, or declared status | Confirmed fact |
| Suspected cause, proposed explanation, or unverified correlation | Hypothesis, clearly labeled |
| Missing owner, deadline, impact number, or root cause | Unknown, never invented |
| Falling error rate above normal baseline | Recovering or monitoring, not resolved |
| Request for retrospective root-cause analysis after resolution | Outside this skill; recommend a post-mortem workflow |

## Output contract

Use this order:

1. `Current snapshot`
2. `Next actions`
3. `Impact`
4. `Mitigation and recovery`
5. `Key timeline`
6. `Hypotheses`
7. `Open questions and unknowns`
8. `Next communication`

Keep the handoff concise enough to scan during a live shift change. Prefer short bullets and compact tables over narrative paragraphs.

## Completion checks

Before returning the handoff, verify that:

- the status and cutoff time are visible;
- confirmed facts and hypotheses are separated;
- no root cause, owner, deadline, impact figure, or resolution state was invented;
- next actions include ownership and timing when supplied;
- unknowns remain visible;
- the next communication commitment is included when supplied; and
- every output statement is traceable to the source notes.
