---
name: synthesize
description: Generate synthesis wiki pages by reading across multiple vault notes, papers, and ideas to surface connections, contradictions, and gaps. Use when the user asks to synthesize notes on a topic, connect papers, write a wiki page, compare approaches, or prepare a section for writing. Triggers on "synthesize", "how do these connect", "write a wiki about", "compare approaches".
argument-hint: "[topic-or-question]"
---

# Synthesize

Read broadly across the vault and generate a synthesis wiki page on a given topic or question.

## Vault context

! `cat /Users/nguyolij/Documents/Obsidian-Vault/AGENTS.md`

## Available papers

! `ls /Users/nguyolij/Documents/Obsidian-Vault/Knowledge/Papers/`

## Available ideas

! `grep '^\- \[\[' /Users/nguyolij/Documents/Obsidian-Vault/Ideas/Ideas\ MOC.md`

## Project MOCs

! `find /Users/nguyolij/Documents/Obsidian-Vault/Projects -name "*MOC*" 2>/dev/null`

## Instructions

The user has asked you to synthesize notes on: `$ARGUMENTS`

### Step 1: Gather sources

Search the vault broadly for relevant content:
- Use the `obsidian-cli` skill's search command to find notes semantically related to the topic
- Read paper notes in `Knowledge/Papers/` that relate to the topic
- Read atomic ideas in `Ideas/` that connect
- Read project notes in `Projects/` if the topic relates to active work
- Read reference material in `Knowledge/` (AI & ML, LLM Infra, Tools)
- Check MOC files for links you might have missed

Use both `obsidian-cli` search and Grep to cast a wide net — synthesis value comes from connecting things the user hasn't connected yet.

### Step 2: Analyze connections

Before writing, identify:
- **Themes**: What recurring patterns appear across sources?
- **Agreements**: Where do multiple sources support the same claim?
- **Contradictions**: Where do sources disagree? Which is more credible and why?
- **Gaps**: What questions are raised but not answered by existing notes?
- **Evolution**: How has thinking on this topic changed across sources?

### Step 3: Discuss with user

Present your findings before writing the synthesis page:
- "I found N relevant notes. Here's what I see..."
- Highlight the most interesting connections and contradictions
- Ask: What angle matters most for your current work?
- Ask: Where should I save this? (suggest a default based on context)

Default save locations:
- Safety research topic → `Projects/LLM Safety Research/Wikis/`
- General ML topic → `Knowledge/AI & ML/`
- Infra topic → `Knowledge/LLM Infra/`
- Cross-cutting → `Knowledge/`

### Step 4: Write the synthesis page

```markdown
---
tags:
  - type/reference
  - {domain tags}
created: {today's date}
---
# {Descriptive Title}

## Overview
{2-3 sentences: what this synthesis covers and why it matters}

## Key Sources
{Bulleted list of [[wikilinks]] to the notes this synthesis draws from}

## Synthesis

### {Theme 1}
{Analysis connecting multiple sources. Use [[wikilinks]] inline when referencing specific notes.}

### {Theme 2}
{Continue with additional themes...}

## Contradictions & Open Questions
{Where sources disagree. What remains unresolved. Frame as questions worth investigating.}

## Gaps
{What's missing from the current knowledge base. Papers to read, experiments to run, questions to ask.}

## Connections
- Related: {[[wikilinks]] to notes not directly used but related}
```

### Step 5: Optional visualizations

When the synthesis involves comparing approaches, showing evolution, or mapping relationships:
- Use the `mermaid-visualizer` skill to embed a Mermaid diagram in the synthesis page (e.g., a flowchart of how papers build on each other, a comparison matrix of approaches)
- Use the `obsidian-bases` skill to create a `.base` file if a structured table view would be useful (e.g., papers by approach/year/dataset/result)

Only add these if they genuinely aid understanding — don't add visuals for the sake of it.

### Step 6: Update MOCs

- Add the synthesis page to the relevant MOC
- If the synthesis surfaced connections between notes that aren't currently linked, suggest adding those links

### Step 7: Surface next steps

Tell the user:
- Papers worth reading to fill gaps
- Experiments that could test open questions
- Ideas worth extracting as standalone atomic notes
- Whether any existing notes should be updated based on the synthesis

## Principles

- **Read first, write second.** Never synthesize from titles alone — read the actual note content.
- **Your own words.** Synthesis is interpretation, not concatenation. The value is in the connections YOU draw.
- **Be honest about confidence.** If a connection is speculative, say so. If a gap exists, name it.
- **Cite everything.** Every claim should trace back to a specific note via [[wikilink]].
- **Make it useful.** A synthesis page should answer a question or illuminate a relationship that wasn't obvious from reading individual notes.
- **Don't duplicate.** If a good synthesis already exists, update it rather than creating a new one.
