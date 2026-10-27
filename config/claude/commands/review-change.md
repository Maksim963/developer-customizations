---
description: Self-assess the current change against idiomatic / minimalistic / correct / maintainable
---

Self-review the changes in this branch against the principles in the project CLAUDE.md. Be honest and specific — the point is to catch scope creep, premature abstraction, and unnecessary complexity before a human reviewer has to.

Read the diff first (`git diff main...HEAD` + `git status`), then assess on these four axes. Report concisely.

## The four checks

1. **Idiomatic** — does the code match patterns already present in the files/directories it touches? Imports, naming, file layout, control flow shape. If it diverges, is there a reason?

2. **Minimalistic** — the one that catches the most. CLAUDE.md explicitly says:
   - Don't add features, refactors, or abstractions beyond what the task requires
   - Don't design for hypothetical future requirements
   - Three similar lines beats a premature abstraction
   - Don't add error handling for scenarios that can't happen
   - Trust internal code and framework guarantees — validate only at system boundaries
   - Don't add feature flags or backwards-compat shims when you can just change the code

   Scan the diff for: new helper functions called in only one place, options/config that aren't used, try/catch around code that can't throw, type guards for unions that are already narrowed, "just in case" null checks, commented-out code, dead branches. Flag each one.

3. **Correct** — does the change solve the stated problem? Any drive-by edits outside scope? Any regressions in adjacent behavior you can spot from the diff alone?

4. **Maintainable** — CLAUDE.md rules on comments:
   - Default to no comments
   - Only add one when the WHY is non-obvious
   - Don't explain WHAT the code does (identifiers do that)
   - Don't reference the current task / callers / fixed issues — those belong in the PR description

   Flag comments that violate these. Flag cryptic identifiers. Flag TODOs without context.

## Output shape

Lead with a verdict: **clean** / **minor nits** / **needs rework**. Then list specific violations with `file:line` or short quotes. Keep it tight — this is a review, not a dissertation.

If clean, one sentence. If violations: group by axis, one line each.

Modify these checks as you see fit — if the change is UI-heavy, lean on `/ds-review` for the DS-specific pass. If the change is tiny, a two-sentence assessment is fine.
