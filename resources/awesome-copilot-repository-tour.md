# Awesome Copilot Repository Tour

This tour shows what is available in Awesome Copilot and how to inspect it with only a web browser. You do not need to clone the repository or install anything.

## Two useful entry points

| Entry point | Best use |
| --- | --- |
| [GitHub repository](https://github.com/github/awesome-copilot) | Inspect the source files, folder structure, history, contributors, and license |
| [Awesome Copilot website](https://awesome-copilot.github.com/) | Search and filter the collection through a friendlier catalog |

The GitHub repository is the source of truth. The website is the easiest discovery interface. This workshop starts in the repository so you can see that every customization is made of inspectable files.

## Repository map

The repository contains several kinds of resources. They solve different problems.

| Area | What you find there | Typical use |
| --- | --- | --- |
| [README](https://github.com/github/awesome-copilot#readme) | Project purpose, entry points, usage notes, and contribution guidance | Understand the collection before browsing individual items |
| [Skills index](https://github.com/github/awesome-copilot/blob/main/docs/README.skills.md) | A searchable table of skill names, descriptions, and bundled assets | Find a reusable workflow with the browser's Find command |
| [Skills](https://github.com/github/awesome-copilot/tree/main/skills) | One folder per skill, containing `SKILL.md` and optional resources | Reuse or study multi-step, on-demand workflows |
| [Agents](https://github.com/github/awesome-copilot/tree/main/agents) | Specialized assistant definitions in `*.agent.md` files | Use a focused role, tool set, or working style for a class of tasks |
| [Instructions](https://github.com/github/awesome-copilot/tree/main/instructions) | Reusable guidance in `*.instructions.md` files | Apply coding standards or practices broadly or to matching files |
| [Plugins](https://github.com/github/awesome-copilot/tree/main/plugins) | Curated bundles of related agents, skills, and configuration | Adopt a larger capability area instead of selecting files one at a time |
| [Hooks](https://github.com/github/awesome-copilot/tree/main/hooks) | Deterministic automation examples such as secret checks and session logging | Enforce actions at defined lifecycle points; this is an advanced topic |
| [Workflows](https://github.com/github/awesome-copilot/tree/main/workflows) | Agentic workflow definitions for repeatable repository tasks and reports | Automate recurring repository work; this is an advanced topic |
| [Canvas extensions](https://github.com/github/awesome-copilot/tree/main/extensions) | Interactive visual experiences for supported Copilot surfaces | Add specialized visual tools; this is outside this workshop |
| [Cookbook](https://github.com/github/awesome-copilot/tree/main/cookbook) | Focused code recipes and runnable examples for Copilot APIs | Learn implementation patterns by example |
| [Learning Hub](https://awesome-copilot.github.com/learning-hub/) | Articles, terminology, tutorials, and hands-on learning paths | Learn concepts before adopting a customization |

You will also see folders such as `.github`, `.schemas`, `eng`, and `website`, plus project configuration files. These maintain the Awesome Copilot project itself. Beginners do not need them for this workshop.

## Focus on the skills area

As of September 4, 2026, the website listed more than 400 skills. The exact number changes as the community contributes and updates items.

Skills cover broad categories, including:

- programming languages and frameworks;
- testing, code review, and security;
- Azure, AWS, databases, and infrastructure;
- documentation, architecture, and planning;
- incident response and operational workflows;
- GitHub repository and pull-request workflows;
- data, media, design, and productivity tasks; and
- tools for creating or evaluating other AI customizations.

A skill can be a single `SKILL.md` file or a larger folder with references, scripts, examples, and templates. More files do not automatically mean a better skill. The right question is whether every file is necessary for the stated outcome.

## How to find a skill in the repository

Use this repeatable browser workflow:

1. Open the [skills index](https://github.com/github/awesome-copilot/blob/main/docs/README.skills.md).
2. Press `Ctrl+F` on Windows or `Cmd+F` on macOS.
3. Search for an outcome or domain, not only a guessed filename. Examples: `incident`, `code review`, `Azure deployment`, or `meeting minutes`.
4. Read the description and bundled-assets column before opening a result.
5. Open the linked skill folder.
6. Read `SKILL.md` from top to bottom.
7. Inspect every referenced script, template, example, or reference file before considering reuse.

The [skills website](https://awesome-copilot.github.com/skills/) is an alternative when you want full-text search, sorting, visible update dates, and file or asset counts.

## How to read `SKILL.md`

Start with the frontmatter at the top:

```yaml
---
name: example-skill
description: 'What the skill does and when it should be used.'
---
```

Then inspect the body. A useful review answers these questions:

| Question | Why it matters |
| --- | --- |
| What exact outcome does it produce? | A related topic may still produce the wrong artifact |
| When should it activate? | The description controls discovery and scope |
| When should it not activate? | Clear exclusions reduce accidental use |
| What input does it require? | Missing prerequisites can make the workflow unusable |
| What ordered steps and decisions does it contain? | A skill should encode more than general advice |
| Which tools, permissions, or network services does it assume? | Your environment may not provide them |
| Which scripts or dependencies can execute code? | These require security and supply-chain review |
| What files will it read, create, or change? | You need to understand its operational impact |
| How does it verify completion? | Observable checks make the workflow dependable |
| When was it last updated? | Current-looking guidance can still target an older product version |

## Guided example for this workshop

The workshop needs a skill that prepares a shift handoff during an active incident.

1. Open the [skills index](https://github.com/github/awesome-copilot/blob/main/docs/README.skills.md).
2. Search the page for `incident`.
3. Open [incident-postmortem](https://github.com/github/awesome-copilot/tree/main/skills/incident-postmortem).
4. Open its [`SKILL.md`](https://github.com/github/awesome-copilot/blob/main/skills/incident-postmortem/SKILL.md).
5. Identify its trigger, output, required inputs, process, and completion expectations.
6. Compare its post-resolution purpose with the workshop's active shift-handoff requirement.

Do not copy or install the skill during this exercise. It is prior art to inspect, not the answer to the workshop scenario.

## Public does not mean automatically approved

Awesome Copilot contains community contributions. Before adopting any item in a customer environment:

1. Inspect the complete folder.
2. Confirm that its outcome and activation scope fit the need.
3. Review scripts, dependencies, tools, permissions, network calls, and licenses.
4. Test when it should and should not activate.
5. Adapt it to local policy in a reviewed internal copy when necessary.
6. Assign an owner for maintenance.

The durable habit is simple: search before building, inspect before trusting, and test before sharing.
