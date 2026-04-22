# AI Slop Cleanup Implementation Plan

**Objective:** Clean the report chapters against the `ai-slop-guide.md` checklist to remove subtle AI-typical vocabulary and structural habits. The report is already exceptionally clean of blatant AI-isms (no "delve", "leverage", or "in conclusion"), but a few flagged adjectives and verbs remain.

**Key Files & Context:**
- `report/chapters/01-introduction.tex`
- `report/chapters/02-literature-review.tex`
- `report/chapters/03-methodology.tex`
- `report/chapters/05-results.tex`
- `report/chapters/06-discussion.tex`
- `report/chapters/07-project-management.tex`

## Implementation Steps

### 1. Adjective & Adverb Replacements
- [ ] **`dynamic`** (Found in 02, 03, 06):
  - *Context:* Used to describe loading and performance baselines.
  - *Action:* Replace with specific mechanical terms like "transient", "high-strain-rate", or "time-dependent" depending on the context.
- [ ] **`foundational`** (Found in 03, 06):
  - *Context:* Refers to prior FEA studies (e.g., "foundational FEA studies by Liu et al.").
  - *Action:* Replace with "benchmark", "early", or "prior" to avoid inflated praise.
- [ ] **`significant`** (Found in 02, 06, 07):
  - *Context:* E.g., "significant uncertainty", "significant factor".
  - *Action:* Replace with "substantial", "measurable", or "primary", unless followed immediately by a statistical figure.
- [ ] **`essential`** (Found in 05):
  - *Context:* "essential to recover physically meaningful force histories".
  - *Action:* Replace with "required to" or "necessary to".

### 2. Verb & Noun Replacements
- [ ] **`facilitate`** (Found in 01):
  - *Context:* "facilitate a systematic performance evaluation".
  - *Action:* Change to "allow for" or rewrite to be more direct (e.g., "The selected objectives establish a systematic...").
- [ ] **`navigate`** (Found in 07):
  - *Context:* "navigate the existing IP".
  - *Action:* Replace with "address", "comply with", or "manage" to remove the metaphor.
- [ ] **`implications`** (Found in 07):
  - *Context:* "significant commercial implications".
  - *Action:* Replace with "commercial potential" or state the exact consequence (e.g., "market impact").

*Note:* The word "milestone" was flagged in Chapter 07, but analysis confirmed it is only used as a LaTeX keyword for the `pgfgantt` chart (e.g., `milestone/.append style`) and will be ignored.

### 3. Transition & Structural Review
- [ ] **Sentence Flow:** Review the sentences containing "In contrast" (05, 06) and "Consequently" (06) to ensure they are not mechanical paragraph openers. Embed the transitions mid-sentence if possible.

## Verification & Testing
- Run `pdflatex` to ensure no LaTeX syntax was broken during text replacement.
- Re-run `grep_search` for the targeted words to confirm 0 hits in the prose.