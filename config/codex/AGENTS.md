## Local Validation Defaults

- In PR/worktree workspaces, prefer targeted local validation that directly covers the changed files or behavior.
- Good defaults: `git diff --check`, direct Vitest file runs, affected package typecheck/lint, focused browser/manual checks, or targeted dev-caller verification.
- Do not run computationally intensive non-targeted checks by default. Avoid repo-wide `pnpm lint`, `pnpm test`, `pnpm build`, `pnpm e2e:test`, broad Turbo runs, full package suites, container integration suites, or paid/offline eval suites unless explicitly requested.
- For ordinary PR validation, prefer letting remote CI handle broad regression coverage.
- If a targeted command unexpectedly fans out into unrelated suites or stale workspace noise, stop broadening, switch to a narrower direct command, and report the limitation.
- Broad local checks are acceptable when I explicitly ask for them, or when reproducing a specific remote CI failure after inspecting the CI logs.
- In final responses and PR descriptions, list the targeted checks run and state when broad checks were intentionally left to CI.
