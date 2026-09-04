# Lab 01: Discover Before You Create

## Outcome

Use Awesome Copilot to decide whether to reuse, adapt, or create a skill for the workshop scenario.

## Why this matters

A new skill creates maintenance work. Search first, then create only when an existing skill does not produce the required outcome.

The Awesome Copilot repository is the public source catalog. You will browse it directly, inspect one complete skill folder, and record your observations in Copilot Chat.

## Step 1: Make the hidden cost visible

Before searching, answer these questions in Chat:

```text
If no shared skill catalog existed:
1. Where would I look for an incident-handoff workflow?
2. What work might every team repeat?
3. How would another person inspect and improve my workflow?
```

The point is not that a public catalog is the only solution. An organization can maintain a private catalog. The point is that isolated chats and copied prompts are difficult to discover, review, version, and maintain.

## Step 2: Search

Complete this step in your web browser. The skills index belongs to the external Awesome Copilot repository, not to your local `Skill_hands-on` workspace.

1. Open the [skills index](https://github.com/github/awesome-copilot/blob/main/docs/README.skills.md).
2. Use `Ctrl+F` on Windows or `Cmd+F` on macOS.
3. Search for `incident`.
4. Read the descriptions and bundled-assets column for the matching skills.
5. Write the relevant candidates and their intended outcomes in your Copilot Chat conversation.

Review the results. A related result is not automatically a suitable result.

If the live catalog has changed, select the closest active-incident or post-incident skill. You can use the [discovery snapshot](../resources/awesome-copilot-discovery-snapshot.md) for the workshop's known comparison.

## Step 3: Inspect the closest candidate

Open the public [`incident-postmortem` skill folder](https://github.com/github/awesome-copilot/tree/main/skills/incident-postmortem), then open its [`SKILL.md`](https://github.com/github/awesome-copilot/blob/main/skills/incident-postmortem/SKILL.md). Reading these pages does not install anything in this repository.

Record these observations in Chat:

```text
Candidate: incident-postmortem
Trigger:
Output:
Required inputs:
Main process:
Bundled scripts or assets:
What an active responder handoff still needs:
```

Use only what you can verify in the public skill folder. Do not ask Copilot to guess what the skill contains.

## Step 4: Check adoption risk

Before deciding to reuse a public item, check:

- whether its trigger and output match the required workflow;
- every referenced script, dependency, tool, and network call;
- license and provenance;
- compatibility with local policy and product versions; and
- positive and negative behavior tests.

For this candidate, focus on workflow fit. The loaded `incident-postmortem` skill has no bundled script, but it still targets a different stage of incident response.

## Step 5: Make the decision

Use these criteria:

| Decision | Choose it when |
| --- | --- |
| Reuse | The existing skill already produces the required outcome |
| Adapt | The workflow fits and only local policy or formatting differs |
| Create | The trigger, workflow stage, or output is materially different |

Record the decision in Chat with this structure:

```text
Candidate:
What it covers:
Required outcome:
Material gap:
Decision: reuse | adapt | create
Reason:
```

## Expected conclusion

Choose `create`.

The closest candidate is designed for a blameless retrospective after an incident has been resolved. The workshop needs a concise operational handoff while response work is still active. The trigger, workflow stage, and output are therefore materially different.

## Checkpoint

Do not continue until your chat contains a clear `create` decision and its rationale. This context will help `/create-skill` understand why the new workflow exists.

Your rationale should show both sides: Awesome Copilot prevented a blind start by providing relevant prior art, and inspection showed why copying that prior art would not satisfy the active-handoff requirement.

## Next

Continue to [Lab 02: Perform the Workflow](02-perform-workflow.md).
