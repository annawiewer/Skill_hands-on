# Lab 03: Create the Skill

## Outcome

Use `/create-skill` to convert the demonstrated chat workflow into a workspace-scoped Agent Skill.

## Step 1: Invoke the creator

In the same Copilot Chat used for Lab 02, send the prompt below. Run `/create-skill` in Copilot Chat, not in a terminal.

```text
/create-skill Create a reusable workspace skill named incident-handoff from the workflow we just completed. It should produce a concise active-incident shift handoff from supplied notes without inventing facts.
```

If `/create-skill` asks follow-up questions, use these workshop decisions:

| Question | Answer |
| --- | --- |
| Scope | Workspace or project |
| Workflow depth | Full multi-step workflow |
| Output | Concise active-incident shift handoff |
| Skill name | `incident-handoff` |
| Location | `.github/skills/incident-handoff/` |

Answer other questions from the workflow you completed in Lab 02. Do not ask Copilot to copy the solution folder.

## Step 2: Let Copilot iterate

`/create-skill` should draft and save the skill, identify ambiguous or weak parts, and ask for clarification when needed.

Require the skill to preserve these rules:

- distinguish facts, hypotheses, and unknowns;
- never invent owners, deadlines, impact figures, or root cause;
- keep the current state and next actions prominent;
- preserve source timestamps and time zones; and
- evaluate the handoff before declaring completion.

## Step 3: Inspect the artifact

Confirm that this file exists:

```text
.github/skills/incident-handoff/SKILL.md
```

Inspect the frontmatter and body with `resources/skill-quality-checklist.md`.

The `name` must match the folder name. The `description` should explain both what the skill produces and when Copilot should use it. Keep automatic model invocation enabled so Lab 04 can test natural-language discovery.

## Step 4: Ask for test prompts

Before ending the creation conversation, ask:

```text
Give me one explicit invocation prompt, one natural-language prompt that should trigger this skill, and one unrelated prompt that should not trigger it.
```

Save those prompts in the chat for Lab 04.

## Checkpoint

You are complete when:

- the skill exists in the required workspace location;
- its folder and frontmatter names match;
- the description contains clear trigger language;
- the body contains the demonstrated procedure and completion checks; and
- you have positive and negative behavior-test prompts.

## Next

Continue to [Lab 04: Test and Improve the Skill](04-test-and-improve.md).
