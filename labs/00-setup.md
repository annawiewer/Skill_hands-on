# Lab 00: Understand and Verify the Tools

## Outcome

Explain the three components used in the workshop, the problem solved by a shared catalog, and one important trust limitation. Then confirm that your workspace can run `/create-skill` and open the public Awesome Copilot collection.

## Prerequisites

- Git installed and available from a terminal
- A supported VS Code or VS Code Insiders build
- GitHub Copilot Chat access
- A web browser with access to public GitHub pages

You do not need prior knowledge of Agent Skills or Awesome Copilot. You will not install any Awesome Copilot content during this lab.

Use fictional workshop data only. Do not paste real customer incidents, credentials, personal data, or internal URLs into the exercise.

## Step 1: Clone and open your workshop workspace

Complete this step even if you read the README on GitHub. If you already cloned and opened the workshop repository, verify the final checklist instead of cloning it again.

1. Open PowerShell, Terminal, or the VS Code terminal in the parent folder where you want to keep the workshop.
2. Clone the workshop repository:

   ```powershell
   git clone https://github.com/annawiewer/Skill_hands-on.git
   ```

3. Enter the cloned folder:

   ```powershell
   cd Skill_hands-on
   ```

4. Open that folder in VS Code:

   ```powershell
   code .
   ```

5. If `code` is not available, open VS Code manually, select **File > Open Folder**, and choose the cloned `Skill_hands-on` folder.
6. When VS Code asks about Workspace Trust, confirm that you trust the workshop authors.
7. In the VS Code Explorer, verify that you can see these items:

   ```text
   README.md
   labs/
   resources/
   scenarios/
   solutions/
   ```

Each participant should use a separate clone because the later labs create and modify local files. You do not need write access to the GitHub repository, and you do not need to push your changes.

**Do not clone Awesome Copilot.** It is a separate public repository that you will inspect in a browser during Step 3.

## Step 2: Learn the three components

Read the [core concepts](../resources/core-concepts.md), [why Awesome Copilot matters](../resources/why-awesome-copilot-matters.md), and the [repository tour](../resources/awesome-copilot-repository-tour.md). Then complete this table without looking back:

| Component | Role |
| --- | --- |
| Agent Skill | A reusable, on-demand playbook stored in the repository |
| `/create-skill` | A built-in Chat workflow that packages a demonstrated process as a skill |
| Awesome Copilot repository | A public collection of community-created Copilot customizations |

If any distinction is still unclear, reread the matching guide and compare it with the table before continuing.

Complete these two sentences:

```text
Awesome Copilot is valuable because ...
Awesome Copilot must not be trusted automatically because ...
```

A strong answer mentions reuse or discovery in the first sentence and community content or validation in the second.

## Step 3: See the public collection

1. Open the [Awesome Copilot repository](https://github.com/github/awesome-copilot) in your web browser.
2. Confirm that the address starts with `github.com/github/awesome-copilot`.
3. Confirm that GitHub marks the repository as `Public`.
4. Open the `skills` folder and select one skill folder.
5. Confirm that the folder contains a `SKILL.md` file, then return to this lab.

You are browsing examples, not installing them. Community content must be reviewed before use, especially when it contains scripts.

Notice the stars, forks, and contributor count. These are evidence of adoption, not evidence that every customization is suitable.

If the public site is blocked, use the local [discovery snapshot](../resources/awesome-copilot-discovery-snapshot.md).

## Step 4: Open GitHub Copilot Chat

Confirm that the cloned `Skill_hands-on` folder is open in VS Code and that Workspace Trust is enabled.

Open GitHub Copilot Chat and select Agent mode so Copilot can create files later in the workshop.

## Step 5: Confirm `/create-skill`

Type `/` in the Chat input and find `/create-skill` in the command list. Do not invoke it yet.

If it is missing:

1. Confirm that GitHub Copilot Chat is enabled and signed in.
2. Confirm that you are using the workshop's required VS Code build.
3. Reload the VS Code window and check again.
4. If it is still missing, stop here. The remaining labs require `/create-skill` in Copilot Chat.

## Step 6: Confirm access to the skills catalog

Open the public [skills index](https://github.com/github/awesome-copilot/blob/main/docs/README.skills.md). Use the browser's Find command to search for `incident`.

Then open the [visual skills catalog](https://awesome-copilot.github.com/skills/) and search for the same term. The two views show the same public collection in different ways:

- The GitHub index is useful for inspecting source links and bundled assets.
- The website is useful for search, sorting, update dates, and file counts.

If the public pages are unavailable, open the [discovery snapshot](../resources/awesome-copilot-discovery-snapshot.md) and use it for Lab 01.

## Checkpoint

You are ready to continue when:

- your own cloned `Skill_hands-on` folder is open and writable in VS Code;
- you can explain the difference between a skill, `/create-skill`, and the public Awesome Copilot repository;
- you can explain one scaling problem solved by a shared catalog and one reason public content still requires review;
- `/create-skill` appears in Chat;
- Agent mode can access the workspace; and
- you can open either the live Awesome Copilot skills catalog or the fallback snapshot.

## Next

Continue to [Lab 01: Discover Before You Create](01-discover-before-create.md).
