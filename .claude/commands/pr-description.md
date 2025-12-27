Generate a PR description for the current branch.

Steps:
1. Run `git branch --show-current` to get current branch name
2. Run `git log main..HEAD --oneline` to see commits on this branch
3. Run `git diff main...HEAD --stat` to see changed files
4. Run `git diff main...HEAD` to see actual changes

Write a PR description with this format:

```
## Summary
<2-3 sentences explaining what this PR does and why>

## Changes
<bulleted list of key changes>

## Testing
<how to test these changes, or "N/A" for config/docs changes>
```

Guidelines:
- Keep it concise — reviewers skim PR descriptions
- Focus on the "what" and "why", not implementation details
- Group related changes together
- Mention any breaking changes or migration steps if applicable
