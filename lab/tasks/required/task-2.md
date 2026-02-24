# Back-end Testing

<h4>Time</h4>

~75 min

<h4>Purpose</h4>

Write unit and end-to-end tests, diagnose bugs from failing test output, and use an AI agent to generate additional test cases.

<h4>Context</h4>

The back-end contains intentional bugs at specific boundary values.
You will discover and fix them by writing tests, then use an AI agent to generate additional coverage.

<h4>Table of contents</h4>

- [1. Steps](#1-steps)
  - [1.1. Follow the `Git workflow`](#11-follow-the-git-workflow)
  - [1.2. Create a `Lab Task` issue](#12-create-a-lab-task-issue)
  - [1.3. Part A: Run unit tests locally](#13-part-a-run-unit-tests-locally)
    - [1.3.1. Run existing unit tests](#131-run-existing-unit-tests)
    - [1.3.2. Add a new unit test](#132-add-a-new-unit-test)
    - [1.3.3. Fix the bug](#133-fix-the-bug)
    - [1.3.4. Rerun unit tests](#134-rerun-unit-tests)
    - [1.3.5. Commit the fix](#135-commit-the-fix)
  - [1.4. Part B: Run end-to-end tests remotely](#14-part-b-run-end-to-end-tests-remotely)
    - [1.4.1. Redeploy the fixed version](#141-redeploy-the-fixed-version)
    - [1.4.2. Run existing end-to-end tests](#142-run-existing-end-to-end-tests)
    - [1.4.3. Add two end-to-end tests](#143-add-two-end-to-end-tests)
    - [1.4.4. Fix the bug](#144-fix-the-bug)
    - [1.4.5. Redeploy and rerun](#145-redeploy-and-rerun)
    - [1.4.6. Commit the fix](#146-commit-the-fix)
  - [1.5. Part C: Generate tests with an AI agent](#15-part-c-generate-tests-with-an-ai-agent)
    - [1.5.1. Generate tests](#151-generate-tests)
    - [1.5.2. Review and curate the tests](#152-review-and-curate-the-tests)
    - [1.5.3. Run the full test suite](#153-run-the-full-test-suite)
    - [1.5.4. Commit the curated tests](#154-commit-the-curated-tests)
  - [1.6. Finish the task](#16-finish-the-task)
- [2. Acceptance criteria](#2-acceptance-criteria)

## 1. Steps

### 1.1. Follow the `Git workflow`

Follow the [`Git workflow`](../../../wiki/git-workflow.md) to complete this task.

### 1.2. Create a `Lab Task` issue

Title: `[Task] Back-end Testing`

### 1.3. Part A: Run unit tests locally

> [!NOTE]
> Unit tests do not require a running server. They test individual functions in isolation.

#### 1.3.1. Run existing unit tests

1. [Run using the `VS Code Terminal`](../../../wiki/vs-code.md#run-a-command-using-the-vs-code-terminal):

   ```terminal
   uv run poe test
   ```

2. All existing tests should pass.

   The output should be similar to this:

   ```terminal
   ===================== N passed in X.XXs =====================
   ```

#### 1.3.2. Add a new unit test

<!-- TODO: specify the exact boundary-value case and the test file path once the seed code is finalized -->

1. [Open the file](../../../wiki/vs-code.md#open-the-file):
   [`tests/unit/<test-file>.py`](../../../tests/).
2. Add a new unit test that targets the following boundary-value case:

   `<!-- TODO: describe the boundary-value case -->`

3. [Run using the `VS Code Terminal`](../../../wiki/vs-code.md#run-a-command-using-the-vs-code-terminal):

   ```terminal
   uv run poe test
   ```

4. Observe that the new test fails.

   The output should be similar to this:

   ```terminal
   FAILED tests/unit/<test-file>.py::<test-name> - <assertion error>
   ```

   This line means the following:
   - The test failed (`FAILED`).
   - The test is in the file `tests/unit/<test-file>.py`.
   - The name of the failing test is `<test-name>`.
   - The failed assertion is `<assertion error>`.

#### 1.3.3. Fix the bug

<!-- TODO: describe the bug location and fix -->

1. [Open the file](../../../wiki/vs-code.md#open-the-file) that contains the bug.
2. Fix the bug.

<details><summary>Click to open a hint</summary>

<!-- TODO: hint — explain the bug in plain English without concrete examples -->

</details>

<details><summary>Click to open the solution</summary>

<!-- TODO: solution — show the before/after code diff -->

</details>

#### 1.3.4. Rerun unit tests

1. [Run using the `VS Code Terminal`](../../../wiki/vs-code.md#run-a-command-using-the-vs-code-terminal):

   ```terminal
   uv run poe test
   ```

2. All tests should pass.

#### 1.3.5. Commit the fix

1. [Commit](../../../wiki/git-workflow.md#commit) your changes.

   Use the following commit message:

   ```text
   fix: <!-- TODO: describe what was fixed -->
   ```

### 1.4. Part B: Run end-to-end tests remotely

> [!NOTE]
> End-to-end tests run on your local machine and send real [HTTP](../../../wiki/http.md) requests to the deployed version on the VM.

#### 1.4.1. Redeploy the fixed version

<!-- TODO: add specific deployment steps referencing the Lab 3 deployment wiki page or process once finalized -->

1. Redeploy the fixed version to your VM using the same process as in Lab 3.

#### 1.4.2. Run existing end-to-end tests

1. [Run using the `VS Code Terminal`](../../../wiki/vs-code.md#run-a-command-using-the-vs-code-terminal):

   <!-- TODO: add e2e test command once finalized -->
   ```terminal
   uv run poe test-e2e
   ```

2. All existing end-to-end tests should pass.

#### 1.4.3. Add two end-to-end tests

<!-- TODO: specify the exact boundary-value cases and the test file path -->

1. [Open the file](../../../wiki/vs-code.md#open-the-file):
   [`tests/e2e/<test-file>.py`](../../../tests/).
2. Add two end-to-end tests that cover the following boundary-value cases:

   `<!-- TODO: describe the boundary-value cases -->`

   <details><summary>Click to open a hint</summary>

   <!-- TODO: hint — explain the cases in plain English without concrete examples -->

   </details>

   <details><summary>Click to open the solution</summary>

   <!-- TODO: solution — show ready test cases -->

   </details>

3. [Run using the `VS Code Terminal`](../../../wiki/vs-code.md#run-a-command-using-the-vs-code-terminal):

   ```terminal
   uv run poe test-e2e
   ```

4. Observe that at least one new test fails.

#### 1.4.4. Fix the bug

1. [Open the file](../../../wiki/vs-code.md#open-the-file) that contains the bug.
2. Fix the bug.

   <details><summary>Click to open a hint</summary>

   <!-- TODO: hint — explain the bug in plain English without concrete instructions -->

   </details>

   <details><summary>Click to open the solution</summary>

   <!-- TODO: solution — show the before/after code fix -->

   </details>

#### 1.4.5. Redeploy and rerun

1. Redeploy the fixed version to the VM.
2. [Run using the `VS Code Terminal`](../../../wiki/vs-code.md#run-a-command-using-the-vs-code-terminal):

   ```terminal
   uv run poe test-e2e
   ```

3. All end-to-end tests should pass.

#### 1.4.6. Commit the fix

1. [Commit](../../../wiki/git-workflow.md#commit) your changes.

   Use the following commit message:

   ```text
   fix: <!-- TODO: describe what was fixed -->
   ```

> [!IMPORTANT]
> Each fix must be a **separate commit**. Do not combine the Part A and Part B fixes into one commit.

### 1.5. Part C: Generate tests with an AI agent

#### 1.5.1. Generate tests

1. Open the AI agent in the back-end project directory.
2. Give it this prompt:

   > "Read the back-end source code and the existing unit tests. Generate five new unit tests that cover edge cases and boundary values not already tested."

3. Wait for the agent to generate the tests.

#### 1.5.2. Review and curate the tests

1. Review each generated test against the following criteria:

   - **Keep** — the test is correct, targets a real case, and adds coverage not already present.
   - **Fix** — the test has a minor error (wrong assertion, wrong expected value) but the idea is sound — correct it.
   - **Discard** — the test duplicates an existing test, is logically wrong, or tests behaviour outside the scope of the module.

2. Keep at least two tests and discard at least one.

#### 1.5.3. Run the full test suite

1. [Run using the `VS Code Terminal`](../../../wiki/vs-code.md#run-a-command-using-the-vs-code-terminal):

   ```terminal
   uv run poe test
   ```

2. All tests (including the curated AI-generated ones) should pass.

#### 1.5.4. Commit the curated tests

1. [Commit](../../../wiki/git-workflow.md#commit) your changes.

   Use the following commit message:

   ```text
   test: add curated AI-generated unit tests
   ```

### 1.6. Finish the task

1. [Create a PR](../../../wiki/git-workflow.md#create-a-pr-to-the-main-branch-in-your-fork) with your changes.
2. [Get a PR review](../../../wiki/git-workflow.md#get-a-pr-review) and complete the subsequent steps in the `Git workflow`.

---

## 2. Acceptance criteria

- [ ] Issue has the correct title.
- [ ] All unit tests pass.
- [ ] All end-to-end tests pass.
- [ ] AI-generated tests include at least two kept tests and at least one discarded test.
- [ ] The Part A fix and Part B fix are separate commits.
- [ ] PR is approved.
- [ ] PR is merged.
