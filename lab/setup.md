# Lab setup

## Find a partner

1. Find a classmate to be your partner for this lab.
2. Sit together.

You'll complete tasks individually, but review each other's work via pull requests.

## Set up a fork

1. Create a `GitHub` account.
2. Fork this repo to your `GitHub` account and make your fork public.
3. Continue your work in the forked repo.
4. In the repo -> `Settings` -> `General` -> `Features`, enable `Issues`.

## Add a classmate as a collaborator

1. In the repo `Settings` -> `Collaborators` -> `Add people`, add your partner as a collaborator.
2. Make sure your collaborator has accepted the invitation sent to their email.

## Set up `git`

(If needed) On your computer, configure [`git`](https://git-scm.com/):

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email"
```

## Set up `VS Code`

1. Install [`VS Code`](https://code.visualstudio.com/). This is our code editor of choice that we'll use in this course.

    ![VS Code UI](./images/vs-code-ui.png)

2. Try opening:
   - **Terminal**: Press `` Ctrl+` `` (`` Cmd+` `` on Mac) — you'll use this to run git commands
   - **Source Control**: Press `Ctrl+Shift+G` (`Cmd+Shift+G` on Mac) — you'll use this to commit changes

## Open the repository on your computer

1. On your computer, create a directory `software-engineering-toolkit`.
2. In that directory, clone the lab repo.

    ```bash
    git clone https://github.com/<your-username>/lab-01-market-product-and-git
    ```

3. Open the repo in `VS Code`.

    ```bash
    cd software-engineering-toolkit
    code lab-01-market-product-and-git
    ```

## Set up `VS Code` extensions

1. Install the recommended `VS Code` extensions (listed in [`.vscode/extensions.json`](../.vscode/extensions.json)) when `VS Code` suggests to install them.
2. Sign in to accounts.
    In the `Activity Bar`:
    1. Click `Accounts`
    2. Click `Sign in with GitHub ...`
    3. Repeat for the remaining extensions if there any.

---

## Optional enhancements

### Repo: Create a label for tasks

In the repo -> `Issues` -> `Labels`, create a new label:
1. Click `New label`.
2. Name: `task`.
3. Click `Create label`.

### Repo: Protect your `main` branch

In the repo -> `Settings` -> `Code and automation` -> `Add branch ruleset`:
1. `Ruleset Name`: `push`
2. `Enforcement status`: `Active`
3. `Target branches` -> `Add target` -> `Include default branch`
4. Rules:
   - [ ] `Restrict deletions`
   - [ ] `Require a pull request before merging`:
      - `Required approvals`: `1`
      - `Require conversation resolution before merging`
      - `Allowed merge methods`: `Merge`.
   - [ ] Block force pushes

### Git: Learn more

- [Git Explained in 100 Seconds](https://www.youtube.com/watch?v=hwP7WQkmECE)
- [What is Git? Explained in 2 Minutes!](https://www.youtube.com/watch?v=2ReR1YJrNOM)
- [A brief introduction to Git for beginners](https://www.youtube.com/watch?v=r8jQ9hVA2qs)
- [How Git Works: Explained in 4 Minutes](https://www.youtube.com/watch?v=e9lnsKot_SQ)
- [Git MERGE vs REBASE: Everything You Need to Know](https://www.youtube.com/watch?v=0chZFIZLR_0)

### VS Code: Check `GitLens`

In the `Status Bar`:

1. Click `Visualize commits on the Commit Graph`.
2. Make sure you can see the commit graph.

In the `Activity Bar`:

1. Click `Source Control`.
2. Click `GitLens` in the opened `Primary Side Bar` to open the `GitLens` panel.
3. In the `GitLens` panel, click `Remotes`.
4. Make sure `origin` points to your repo URL.
5. In the `GitLens` panel, click `Commits`.
6. Make sure you can see commits on the current branch.

Learn more about [`GitLens` features](https://help.gitkraken.com/gitlens/gitlens-features/).

### Shell: Set up the prompt

Install [`Starship`](https://github.com/starship/starship#-installation).

### Coding: Set up a coding agent

Set up a free coding agent to help you with the lab. See [Coding agents](./appendix/coding-agents.md).
