# Lab 05: Peer Challenge

## Outcome

Validate that another participant can use the skill without access to its creation conversation or verbal coaching from its author.

## Step 1: Prepare the review

Work in pairs. The author leaves the generated skill in the workspace and closes the creation chat. The reviewer may inspect repository files but must not read the author's previous chat.

The author must not explain how to invoke the skill or what the output should contain.

If you are working alone, act as the reviewer in a fresh chat and record the result as a provisional self-check. A later test by another person is still required for full peer validation.

## Step 2: Run the challenge

The reviewer starts a fresh chat and sends:

```text
The active incident response is changing shifts. Use scenarios/incident-notes.md to prepare everything the incoming responder needs.
```

This prompt intentionally avoids the skill name. It tests whether the description supports natural-language discovery.

## Step 3: Score the result

| Criterion | Pass condition |
| --- | --- |
| Discovery | Copilot applies the active incident-handoff workflow |
| Current state | Active status, severity, region, and recovery state are prominent |
| Trust | No root cause, owner, user count, or resolution state is invented |
| Actions | Monitoring, configuration comparison, and communication actions are visible |
| Unknowns | Missing impact and ownership information remains explicit |
| Usability | The incoming responder can find the next action in under one minute |

All trust criteria and at least five of the six total criteria must pass.

## Step 4: Give actionable feedback

The reviewer provides one of these outcomes:

- `PASS`: The skill is reusable without author assistance.
- `REVISE`: Name one observed behavior, the expected behavior, and the smallest likely skill change.

If the result is `REVISE`, the author makes one focused change and the reviewer reruns the same prompt in a fresh chat.

Then swap roles.

## Step 5: Compare with the reference

After both participants pass, compare the generated skill with `solutions/incident-handoff/SKILL.md`.

Do not optimize for identical wording. Compare discovery scope, decision rules, ordered procedure, output contract, and completion checks.

## Debrief

Discuss these questions:

1. Which details came from the source conversation rather than the `/create-skill` command?
2. Which frontmatter words made automatic discovery more reliable?
3. What did the fresh-chat test reveal?
4. When would instructions, a prompt file, or a custom agent be a better choice than a skill?

## Finish

Return to the [workshop README](../README.md) and confirm every item under **You are finished when**.
