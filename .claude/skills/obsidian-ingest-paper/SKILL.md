---
name: ingest-paper
description: Ingest a research paper into the Obsidian vault. Reads the paper (from URL, PDF, or pasted content), fills the paper note template, creates atomic idea notes, and updates relevant MOCs. Use when the user wants to add a paper, shares an arXiv link, says "ingest this paper", or asks to process a research paper.
argument-hint: "[paper-url-or-title]"
---

# Ingest Paper

Process a research paper and integrate it into the Obsidian vault knowledge system.

## Vault context

! `cat /Users/nguyolij/Documents/Obsidian-Vault/AGENTS.md`

## Current papers

! `ls /Users/nguyolij/Documents/Obsidian-Vault/Knowledge/Papers/`

## Current Ideas index

! `grep -c '^\- \[\[' /Users/nguyolij/Documents/Obsidian-Vault/Ideas/Ideas\ MOC.md || echo "0 ideas"`

## Instructions

You are ingesting a paper into an Obsidian vault. Follow these steps:

### Step 1: Read the paper

If given a URL, **prefer the `/defuddle` skill** over WebFetch — it extracts cleaner markdown with less noise. If given a PDF path, use Read. If content is pasted, work from that.

Extract:
- Title, authors, year, URL
- Core problem and why it matters
- Approach (intuition + step-by-step)
- Key insight (the one thing this paper contributes)
- Key findings (numbered)
- Limitations
- Connections to existing papers in the vault

### Step 2: Create the paper note

Save to `Knowledge/Papers/{Paper Title}.md` using this exact template:

```markdown
---
tags:
  - type/reference
  - {domain tags: safety, llm, ml, agents, etc.}
created: {today's date}
authors: {comma-separated}
year: {publication year}
url: {paper URL}
reading-status: notes-done
---
# {Paper Title}

## TL;DR
- {1-2 sentence summary}

## Problem
- {What problem does this paper solve?}
- {Why is the problem important?}

## Approach
- Core intuition: {one sentence}
- How it works step-by-step:
  1. {step}
  2. {step}

## Key Idea (why this matters)

> {The one insight this paper contributes}

## Key Findings
1. {finding}

## Limitations
- {limitation}

## What I Learned / Takeaways
- {your synthesis, not just restating the paper}

## Follow-ups
- Re-read section: {if applicable}
- Try implementing: {if applicable}
- Discuss / add to reading list: {related papers to find}

## Connections
- Related papers: {link to existing papers in Knowledge/Papers/ using [[wikilinks]]}
- Links to my notes:
  - [[{relevant Ideas or Knowledge notes}]]
```

### Step 3: Discuss with the user

Before creating Ideas or updating MOCs, discuss:
- What are the key takeaways from your perspective?
- Which insights are novel enough to be standalone Ideas?
- How does this connect to what you're currently working on?

### Step 4: Create atomic Ideas (if warranted)

For genuinely novel insights, create notes in `Ideas/` following Zettelkasten convention:
- Title IS the idea: `Classifier-based safety outperforms prompt-based at scale.md`
- One idea per note
- Write in own words, not paper's words
- Link back to the paper note and other related Ideas

```markdown
---
tags:
  - type/idea
  - {domain tags}
created: {today's date}
---
# {Idea as title}

{2-4 sentences explaining the idea in your own words. Reference the source.}

Source: [[{Paper Title}]]
```

### Step 5: Update MOCs

- Add the paper to `Knowledge/AI & ML/AI & ML MOC.md` under the appropriate section
- If it's a safety paper, also add to `Projects/LLM Safety Research/LLM Safety Research MOC.md` under Literature
- Add any new Ideas to `Ideas/Ideas MOC.md`

### Step 6: Surface connections

Use the `obsidian-cli` skill's search command to find related notes across the vault beyond what's in the MOCs. Then tell the user:
- Which existing papers in the vault relate to this one (and how)
- Whether this paper contradicts, supports, or extends existing notes
- Potential follow-up papers to read based on the citations
- Any gaps this paper reveals in the current knowledge base

## Important

- Always read the paper thoroughly before writing notes
- Do NOT copy-paste from the paper. Summarize in your own words.
- Ask the user for guidance on emphasis and which ideas to extract
- If the paper is behind a paywall and can't be fetched, ask the user to paste the content
