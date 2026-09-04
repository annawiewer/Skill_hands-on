# Facilitator Guide

## Purpose

This workshop teaches participants to create a reusable GitHub Copilot Agent Skill from a workflow they have already demonstrated in Copilot Chat. The workshop also establishes a reuse-first habit by searching Awesome Copilot before creating a new skill.

## Audience

The default audience is developers, technical writers, platform engineers, and technical leads who can open a repository and use basic GitHub Copilot Chat. Assume participants have never used Agent Skills, `/create-skill`, or Awesome Copilot.

## Duration

The workshop supports delivery formats from 30 to 120 minutes. Select the format by the outcome the audience needs, not simply by fitting more slides into less time.

| Duration | Delivery mode | Exit outcome | Coverage |
| --- | --- | --- | --- |
| 30 minutes | Quick introduction | Participants understand the concept and observe the workflow | Definition, repository tour, candidate inspection, and facilitator demonstration |
| 60 minutes | Core hands-on | Participants create a first skill | Condensed concepts and Labs 00-03 |
| 90 minutes | Build and test | Participants create and test a skill in fresh chats | Condensed concepts and Labs 00-04 |
| 120 minutes | Complete workshop | Participants create, test, improve, and peer-validate a skill | Full concepts, Labs 00-05, and debrief |

Do not present the 30-minute format as equivalent to the complete workshop. It demonstrates the loop but does not provide enough time for every participant to create and validate a reusable skill.

### Complete 120-minute agenda

| Activity | Time |
| --- | ---: |
| Core concepts and Awesome Copilot deep dive | 20 min |
| Lab 00: Concept review and environment preflight | 10 min |
| Lab 01: Discover before creating | 15 min |
| Lab 02: Perform the workflow | 15 min |
| Lab 03: Create the skill | 20 min |
| Lab 04: Test and improve | 20 min |
| Lab 05: Peer challenge | 15 min |
| Debrief | 5 min |

## Before the workshop

Verify the following on the same VS Code build participants will use:

- GitHub Copilot Chat is available and signed in.
- Agent mode can read and write files in a trusted workspace.
- Typing `/` in Chat shows `/create-skill`.
- The public [Awesome Copilot repository](https://github.com/github/awesome-copilot) can be opened from the customer network without repository credentials.
- The [skills index](https://github.com/github/awesome-copilot/blob/main/docs/README.skills.md), [visual skills catalog](https://awesome-copilot.github.com/skills/), and [incident-postmortem skill](https://github.com/github/awesome-copilot/tree/main/skills/incident-postmortem) are accessible.
- A clean clone of this repository does not contain `.github/skills/incident-handoff/`.
- The fallback discovery snapshot is available if the customer network blocks public GitHub pages.

Participants need only a browser and GitHub Copilot Chat. Do not add optional integration setup to the workshop unless the customer explicitly asks for it.

Do not demonstrate the completed solution before participants create their own version. The solution is a review aid, not a template to copy.

## Mental model

Ask participants to open `resources/core-concepts.md`, `resources/why-awesome-copilot-matters.md`, and `resources/awesome-copilot-repository-tour.md`. Teach the concepts in this order:

1. A skill is a reusable, on-demand playbook stored in a `SKILL.md` file.
2. The skill description helps Copilot discover when that playbook is relevant.
3. `/create-skill` packages a workflow that has been demonstrated in the conversation.
4. Awesome Copilot is a public collection of community-created customizations.

Avoid introducing all Copilot customization types at once. After participants can explain the four points above, use this decision table:

| Customization | Best fit |
| --- | --- |
| Instructions | Guidance that should apply broadly or to files matching a pattern |
| Prompt file | One focused, repeatable task with inputs |
| Skill | An on-demand workflow with procedures and optional resources |
| Custom agent | Context isolation, a specialist persona, or restricted tools |

The two parts of this workshop answer different questions:

- The Awesome Copilot repository asks, "Does a suitable skill already exist?"
- `/create-skill` asks, "How do I package the workflow demonstrated in this conversation?"

Emphasize that Awesome Copilot content can come from third-party contributors. Public availability does not remove the need to inspect instructions and bundled scripts before reuse.

## Deep-dive teaching notes

Do not frame Awesome Copilot as mandatory or as trustworthy because it is popular. Use this claim, evidence, mechanism, and limit sequence:

1. **Claim:** Teams need shared, discoverable, reviewable AI workflows. Awesome Copilot is one prominent public catalog that addresses this need.
2. **Evidence:** As of September 4, 2026, GitHub showed approximately 38,600 stars, 4,900 forks, and 502 contributors. The repository spans agents, instructions, skills, hooks, workflows, plugins, and learning material.
3. **Mechanism:** Plain, versioned files make workflows inspectable and portable. A common structure, public source folders, generated indexes, website search, and learning material make a large collection discoverable.
4. **Limit:** Adoption metrics show attention, not correctness. Community items can be stale, unsafe for a particular environment, or incompatible with local policy.

The useful enterprise pattern is:

```text
public upstream -> discover -> inspect -> test -> adapt -> approve internally -> maintain
```

Ask participants to explain this sentence in their own words:

> Awesome Copilot is optional; search-before-build and inspect-before-trust are the durable engineering practices.

## Repository walkthrough

Use the repository tour to demonstrate these layers in order:

1. Open the repository root and point out its public status, README, license, contributors, and recent history.
2. Show the end-user resource areas: skills, agents, instructions, plugins, hooks, workflows, canvas extensions, cookbook, and Learning Hub.
3. Explain that `.github`, `.schemas`, `eng`, and `website` maintain the catalog itself and are not the starting point for workshop participants.
4. Open `docs/README.skills.md` and use the browser's Find command for `incident`.
5. Open the `incident-postmortem` folder and inspect its `SKILL.md` plus any bundled files.
6. Stop before copying or installing anything. The learning objective is evidence-based selection, not catalog installation.

## Demonstration

Show two short `/create-skill` invocations:

1. In a new chat with no workflow context, invoke `/create-skill` and point out the clarification questions.
2. In a prepared chat containing a completed workflow, invoke `/create-skill` and point out how it extracts steps, decisions, and quality checks.

Do not finish creating either demonstration skill. Participants should experience the complete creation flow themselves.

## Facilitation checkpoints

Pause after each lab and ask for observable evidence:

| Lab | Evidence |
| --- | --- |
| 00 | The participant can explain the repository structure and why a shared catalog exists; `/create-skill` is visible and the public skills index opens |
| 01 | The participant records a justified `create` decision and names the checks required before adopting public content |
| 02 | Chat produces an acceptable handoff before any skill exists |
| 03 | `.github/skills/incident-handoff/SKILL.md` exists |
| 04 | Explicit, automatic, negative, and fresh-chat tests pass |
| 05 | A peer succeeds without verbal coaching |

## Intervention rules

- If public Awesome Copilot pages are unavailable, use the supplied snapshot and continue.
- If `/create-skill` is unavailable, stop the workshop and correct the VS Code or Copilot version. Manual authoring would miss the main learning objective.
- If Copilot invents incident facts, return to Lab 02 and strengthen the workflow before generating the skill.
- If the generated skill only works in the original chat, require a fresh-chat test and move missing context into `SKILL.md`.
- If automatic discovery is unreliable, improve the frontmatter `description` before adding more instructions to the body.

## Completion standard

A participant is complete only when another participant can use the skill from a fresh chat without receiving additional verbal instructions.
