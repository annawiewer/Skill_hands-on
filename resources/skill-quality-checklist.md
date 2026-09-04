# Skill Quality Checklist

Use this checklist after `/create-skill` generates the participant artifact.

## Location and naming

- The file is `.github/skills/incident-handoff/SKILL.md`.
- The folder name is lowercase and hyphenated.
- The frontmatter `name` is `incident-handoff`.
- YAML frontmatter is enclosed by `---` markers and uses spaces, not tabs.

## Discovery

- The description states what the skill produces.
- The description states when to use the skill.
- Trigger language includes active incident, responder handoff, shift change, or transfer of ownership.
- The description does not claim to produce a retrospective post-mortem.
- Automatic model invocation is not disabled.

## Workflow

- Required inputs are explicit.
- Ordered steps classify facts, generate the handoff, and evaluate it.
- Decision rules distinguish confirmed facts, hypotheses, and unknowns.
- Missing values remain missing instead of being invented.
- Completion checks are observable.

## Scope

- The skill contains only knowledge needed for incident handoffs.
- Optional detail is moved to referenced files only when it materially improves the workflow.
- Every resource path is relative to `SKILL.md` and begins with `./`.
- The core workflow can run without hidden context from the creation conversation.
