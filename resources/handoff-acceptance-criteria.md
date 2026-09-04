# Incident Handoff Acceptance Criteria

Use this checklist to assess the handoff produced in Lab 02 and the reusable skill created later.

## Required sections

- Incident snapshot: name, status, severity, and current time
- Current impact: affected service, region, observed metric, and baseline when known
- Timeline: only events that matter to the incoming responder
- Mitigation and recovery state
- Confirmed facts
- Hypotheses that are explicitly labeled as unconfirmed
- Open questions and missing information
- Next actions with owner and target time when known
- Next communication commitment

## Trust rules

- Do not invent a root cause, user count, order count, owner, deadline, or resolution state.
- Preserve timestamps and time zones from the source.
- Separate confirmed facts from hypotheses.
- Mark a missing owner as `Unassigned` rather than guessing.
- Mark a missing target time as `Not provided` rather than guessing.
- Do not describe an active incident as resolved.

## Quality bar

- The incoming responder can identify the current state in under one minute.
- The first three next actions are visible without reading the full timeline.
- Each statement can be traced to the supplied notes.
- Unknowns remain visible instead of being smoothed over.
- The output is concise enough to use during a live shift change.
