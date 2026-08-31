---
name: triage-inbox
description: Audit and organize the Obsidian vault +Inbox/ folder. Reads all inbox files, categorizes them into the PARA structure, proposes destinations, and walks through approvals interactively before moving anything. Use when the user says "clean up inbox", "triage inbox", "organize inbox", or when +Inbox/ has accumulated files.
---

# Triage Inbox

Audit and organize the `+Inbox/` folder in the Obsidian vault.

## Vault context

! `cat /Users/nguyolij/Documents/Obsidian-Vault/AGENTS.md`

## Current inbox

! `ls -la /Users/nguyolij/Documents/Obsidian-Vault/+Inbox/`

## Current vault structure

! `ls /Users/nguyolij/Documents/Obsidian-Vault/`

## Instructions

### Step 1: Audit

Read every file in `+Inbox/`. For each file, determine:
- **Content type**: paper, idea, project doc, reference, bookmark stub, personal, credentials, placeholder
- **Substance level**: stub (< 5 lines), medium, full
- **Staleness**: check `created` date in frontmatter, or file modification time

### Step 2: Categorize

Assign each file to one of these actions:

| Category | Destination | Criteria |
|----------|-------------|----------|
| Paper/reference | `Knowledge/Papers/` or `Knowledge/{topic}/` | Substantial reference material |
| Tool docs | `Knowledge/Tools/{tool}/` | Documentation about a tool |
| Infra reference | `Knowledge/LLM Infra/` | GPU, AWS, model serving info |
| Work docs | `Areas/Work/Docs/Wikis/` or `Proposals/` | Work-specific wikis or proposals |
| Project notes | `Projects/{project}/` | Notes tied to a specific deliverable |
| Atomic ideas | `Ideas/` | Single insights, rename to idea-as-title format |
| Idea braindumps | Cluster by theme, keep in `+Inbox/` or move to relevant project | Multi-idea lists |
| Personal | `Personal/` (with subfolders: Travel/, etc.) | Non-work items |
| Bookmark stubs | Consolidate into existing bookmark files | Just a URL with no context |
| Credentials | Flag to user — should not live in vault | API keys, tokens, passwords |
| Stale/done | `Archive/` | Completed work, outdated notes |
| Junk | Delete | Placeholders, duplicates, empty files |

### Step 3: Present plan

Show the user a table of ALL files with proposed actions. Group by category. Include:
- Filename
- One-line summary
- Proposed destination (with new filename if renaming)
- Reasoning

### Step 4: Interactive approval

Use AskUserQuestion to walk through the plan in batches. Ask clarifying questions for files where the destination is ambiguous. The user may:
- Approve a batch
- Redirect specific files
- Ask you to read a file's content before deciding
- Mark items as "skip for now"

**Never move files without explicit approval.**

### Step 5: Execute

For each approved batch:
1. Create destination folders if needed
2. Move files (use `mv`, rename if approved)
3. Add frontmatter to files that lack it
4. Consolidate bookmark stubs into existing reference files where possible
5. For idea braindumps: ask user which ideas are still alive before breaking apart

### Step 6: Update MOCs

After all moves are complete, update relevant MOCs:
- `Ideas/Ideas MOC.md` for new Ideas
- `Knowledge/Tools/Tools MOC.md` for new tool docs
- `Knowledge/AI & ML/AI & ML MOC.md` for new ML references
- Any project MOCs that gained new files

### Step 7: Report

Show final state:
- How many files processed
- How many remain in inbox (and why)
- Any files flagged for user attention (credentials, ambiguous items)

## Rules

- Always read a file before categorizing it
- Ask the user before deleting anything substantial
- Consolidate bookmark stubs rather than creating many tiny files
- When renaming, follow vault conventions (descriptive names with spaces, no date prefix unless temporal)
- If a file contains credentials, flag it immediately — do not move it
- Prefer merging related stubs over creating many small files
- Files with links: use the `defuddle` skill to fetch link content cleanly (prefer over WebFetch)
- Use `obsidian-cli` search to check if similar content already exists in the vault before creating duplicates
