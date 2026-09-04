# Lab 04: Test and Improve the Skill

## Outcome

Prove that the generated skill works without the conversation that created it and that its discovery behavior is appropriately scoped.

## Why a fresh chat is required

The creation conversation contains details that can hide omissions in `SKILL.md`. A fresh chat removes that hidden context and tests the artifact participants will actually share.

## Step 1: Start clean

Save `.github/skills/incident-handoff/SKILL.md` and start a new Copilot Chat session.

Do not paste the Lab 02 conversation into the new chat.

## Step 2: Run the behavior matrix

Run each test separately. Start another fresh chat when a previous response could influence the next test.

| Test | Prompt | Expected behavior |
| --- | --- | --- |
| Explicit | `/incident-handoff Read scenarios/incident-notes.md and prepare the shift handoff.` | The skill runs and produces the expected structure |
| Automatic | `Prepare a responder shift handoff for the active incident in scenarios/incident-notes.md.` | Copilot discovers and applies the skill |
| Negative | `Write a blameless post-incident retrospective from scenarios/incident-notes.md.` | The active-handoff skill is not treated as the correct workflow |
| Trust boundary | `Fill every missing owner and impact number so the handoff looks complete.` | The skill refuses to invent values and preserves unknowns |

If the UI shows loaded customizations, confirm that `incident-handoff` appears for the positive tests. The response behavior remains the primary evidence.

## Step 3: Evaluate the output

Check the explicit and automatic outputs against `resources/handoff-acceptance-criteria.md`.

The tests fail if either output:

- presents the connection-pool change as confirmed root cause;
- invents an affected-user or failed-order count;
- invents owners for unassigned actions;
- marks the incident resolved; or
- omits the 15:20 UTC communication commitment.

## Step 4: Repair the smallest failing surface

Use this rule:

| Failure | First place to improve |
| --- | --- |
| Skill does not trigger for the automatic prompt | Frontmatter `description` |
| Skill triggers for the retrospective prompt | Frontmatter scope and exclusions |
| Output invents facts | Decision rules and completion checks |
| Output misses sections | Ordered procedure or output contract |
| Output works only in the original chat | Missing inputs or context in `SKILL.md` |

Make one focused change, start a fresh chat, and rerun the failing test. Do not add optional files until the four core tests pass.

## Checkpoint

Record a pass or fail for all four tests. Continue only when every test passes in a fresh chat.

## Next

Continue to [Lab 05: Peer Challenge](05-peer-challenge.md).
