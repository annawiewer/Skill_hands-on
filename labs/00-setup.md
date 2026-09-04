# Lab 00: Understand and Verify the Tools

## Outcome

Explain the three components used in the workshop, the problem solved by a shared catalog, and one important trust limitation. Then confirm that your workspace can run `/create-skill` and open the public Awesome Copilot collection.

## Prerequisites

- A supported VS Code or VS Code Insiders build
- GitHub Copilot Chat access
- A trusted copy of this repository
- A web browser with access to public GitHub pages

You do not need prior knowledge of Agent Skills or Awesome Copilot. You will not install any Awesome Copilot content during this lab.

Use fictional workshop data only. Do not paste real customer incidents, credentials, personal data, or internal URLs into the exercise.

## Step 1: Learn the three components

Read the [core concepts](../resources/core-concepts.md), [why Awesome Copilot matters](../resources/why-awesome-copilot-matters.md), and the [repository tour](../resources/awesome-copilot-repository-tour.md). Then complete this table without looking back:

| Component | Role |
| --- | --- |
| Agent Skill | A reusable, on-demand playbook stored in the repository |
| `/create-skill` | A built-in Chat workflow that packages a demonstrated process as a skill |
| Awesome Copilot repository | A public collection of community-created Copilot customizations |

Ask the facilitator about any distinction that is still unclear.

Complete these two sentences:

```text
Awesome Copilot is valuable because ...
Awesome Copilot must not be trusted automatically because ...
```

A strong answer mentions reuse or discovery in the first sentence and community content or validation in the second.

## Step 2: See the public collection

Open the [Awesome Copilot repository](https://github.com/github/awesome-copilot) in a browser. Notice that GitHub marks it as `Public`, then open its `skills` folder.

You are browsing examples, not installing them. Community content must be reviewed before use, especially when it contains scripts.

Notice the stars, forks, and contributor count. These are evidence of adoption, not evidence that every customization is suitable.

If the public site is blocked on the customer network, continue with the supplied workshop snapshot.

## Step 3: Open the workspace

Open the repository folder in VS Code and confirm that Workspace Trust is enabled.

Open GitHub Copilot Chat and select Agent mode so Copilot can create files later in the workshop.

## Step 4: Confirm `/create-skill`

Type `/` in the Chat input and find `/create-skill` in the command list. Do not invoke it yet.

If it is missing:

1. Confirm that GitHub Copilot Chat is enabled and signed in.
2. Confirm that you are using the workshop's required VS Code build.
3. Reload the VS Code window and check again.
4. Ask the facilitator before continuing.

## Step 5: Confirm access to the skills catalog

Open the public [skills index](https://github.com/github/awesome-copilot/blob/main/docs/README.skills.md). Use the browser's Find command to search for `incident`.

Then open the [visual skills catalog](https://awesome-copilot.github.com/skills/) and search for the same term. The two views show the same public collection in different ways:

- The GitHub index is useful for inspecting source links and bundled assets.
- The website is useful for search, sorting, update dates, and file counts.

If the public pages are unavailable, open the [discovery snapshot](../resources/awesome-copilot-discovery-snapshot.md) and use it for Lab 01.

## Checkpoint

You are ready to continue when:

- you can explain the difference between a skill, `/create-skill`, and the public Awesome Copilot repository;
- you can explain one scaling problem solved by a shared catalog and one reason public content still requires review;
- `/create-skill` appears in Chat;
- Agent mode can access the workspace; and
- you can open either the live Awesome Copilot skills catalog or the fallback snapshot.
