# Lab 02: Perform the Workflow

## Outcome

Develop and verify a useful incident-handoff workflow in Copilot Chat before packaging it as a skill.

## Why the conversation comes first

`/create-skill` can extract procedures, decision points, and quality checks from the current conversation. A stronger source workflow produces a stronger reusable skill.

## Step 1: Inspect the input

Open `scenarios/incident-notes.md`, then send:

```text
Read scenarios/incident-notes.md. Before drafting a handoff, list the facts that are confirmed, the statements that are only hypotheses, and the important information that is missing. Do not infer missing values.
```

Check that the suspected connection-pool change is not presented as a confirmed root cause.

## Step 2: Produce the first handoff

Send:

```text
Create a concise shift handoff for the incoming incident responder. Put the current state and next actions first. Preserve UTC timestamps, label hypotheses, use Unassigned for missing owners, and do not describe the incident as resolved.
```

Do not edit a file yet. Keep the workflow in Chat so it remains available to `/create-skill`.

## Step 3: Evaluate the output

Open `resources/handoff-acceptance-criteria.md` and ask Copilot to evaluate its own handoff against every criterion.

Use this prompt:

```text
Evaluate the handoff against resources/handoff-acceptance-criteria.md. Return a table with criterion, pass or fail, and evidence. Then revise only the failed parts.
```

Manually verify these high-risk details:

- The incident remains active.
- The root cause remains unconfirmed.
- The affected-user and failed-order counts remain unknown.
- Missing action owners are shown as `Unassigned`.
- The next status update remains due by 15:20 UTC.

## Step 4: Expose the reusable process

Send:

```text
Summarize the reusable workflow we followed. Separate required inputs, ordered steps, decision rules, and completion checks. Do not create files yet.
```

Review the summary. It should include fact classification, handoff generation, a no-invention rule, and an acceptance-criteria review.

## Checkpoint

Continue only when the chat contains:

- a handoff that passes the acceptance criteria;
- at least one explicit decision rule;
- a list of missing information that was not invented; and
- a summarized reusable workflow.
