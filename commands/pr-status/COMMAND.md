---
name: pr-status
description: Check the status of XPOZ plugin PRs submitted to community marketplaces
---

# PR Status Command

Check the status of open PRs for the XPOZ Brand Intelligence plugin across community marketplaces.

## Instructions

When the user runs `/pr-status`, execute the following steps:

### Step 1: Check awesome-claude-code-plugins PR

Run this command to check the PR status:

```bash
gh pr view 14 --repo ccplugins/awesome-claude-code-plugins --json state,title,reviews,comments,mergeable,mergedAt,closedAt,createdAt,url
```

### Step 2: Check any other tracked PRs

If there are additional PRs to track, check them as well.

### Step 3: Format Output

Present the results in a clear table format:

| Repository | PR # | Status | URL |
|------------|------|--------|-----|
| awesome-claude-code-plugins | #14 | [state] | [url] |

### Status Indicators

- 🟢 **MERGED** - PR was accepted and merged
- 🟡 **OPEN** - PR is still under review
- 🔴 **CLOSED** - PR was closed without merging

### Additional Info

If there are comments or review requests, summarize them for the user.

## Tracked PRs

| Repository | PR # | Description |
|------------|------|-------------|
| `ccplugins/awesome-claude-code-plugins` | #14 | Add XPOZ Brand Intelligence plugin |

## Notes

- The `anthropics/claude-plugins-official` repo does not accept external PRs
- Official submissions must go through: https://docs.google.com/forms/d/e/1FAIpQLSdeFthxvjOXUjxg1i3KrOOkEPDJtn71XC-KjmQlxNP63xYydg/viewform
