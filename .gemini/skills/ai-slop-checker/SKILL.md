---
name: ai-slop-checker
description: Analyzes text for AI-influenced sentence construction, "AI slop," and LLM stylistic tics. Use when asked to humanize text, check for AI-generated feel, or improve the authenticity of technical writing.
---

# AI Slop Checker & Humanizer

This skill provides a structured methodology for identifying and correcting stylistic markers indicative of Large Language Model (LLM) generation, often referred to as "AI slop" or "AI-isms." 

## Core Principles of "AI Slop"
Academic research in stylometry and linguistics indicates that LLM-generated text differs from human writing in several key ways:
1.  **Low Lexical Diversity:** Over-reliance on "safe," statistically probable words and repetitive sentence lengths.
2.  **Over-Structuring:** Excessive use of signposting, transition words, and balanced "on the one hand / on the other hand" rhetoric.
3.  **Epistemic Hedging:** A lack of decisive technical stance, relying instead on over-polite or heavily hedged claims.
4.  **The "Vibe":** A smooth, predictable drone that lacks the "burstiness" (varying sentence lengths and complexities) typical of human subject-matter experts.

## The AI-ism Lexicon (Words to Flag and Replace)
When auditing text, use search tools to find and eradicate these common markers:

### 1. Filler Transitions
*   **Flag:** *Furthermore, Moreover, Additionally, Consequently, Notably, Interestingly, Arguably.*
*   **Fix:** Remove entirely and start a new sentence, use a semicolon, or use domain-specific causal links (e.g., "resulting in," "yielding").

### 2. The "Throat-Clearers"
*   **Flag:** *It is important to note that, It is worth considering, In today's fast-paced world, As previously mentioned.*
*   **Fix:** Delete the preamble. State the fact directly. 

### 3. Vague/Marketing Verbs & Nouns
*   **Flag:** *Delve, Harness, Leverage, Utilize, Foster, Empower, Tapestry, Landscape, Realm, Testament.*
*   **Fix:** Replace with precise technical actions. Use "Analyze," "Examine," "Apply," "Use," or "Demonstrate."

### 4. Fluff Adjectives
*   **Flag:** *Comprehensive, Pivotal, Vital, Intricate, Robust, Seamless, Synergistic.*
*   **Fix:** Let the data or methodology prove the importance. Instead of "a robust methodology," describe *why* it is robust (e.g., "a multi-phase, thermodynamically validated methodology").

## Auditing Workflow

1.  **Ingest Text:** Read the provided text or document.
2.  **Lexical Scan:** Scan specifically for the words in the AI-ism Lexicon.
3.  **Structural Audit:** 
    *   Check for repetitive sentence lengths (lack of burstiness).
    *   Check for the "Summary Signpost" (e.g., ending paragraphs with "In conclusion" or "Ultimately").
4.  **Humanization:** Rewrite the flagged sections to be direct, decisive, and technically dense. Ensure active or passive voice is used naturally, as an engineer would write.

## Example Transformation

**AI Slop:**
> "Furthermore, it is important to note that the Bamboo-HDPE composite leverages its unique material properties to foster a more robust impact response. Notably, the data stands as a testament to its potential."

**Humanized Technical Text:**
> "The 30% wt Bamboo-HDPE composite demonstrated increased structural stiffness during impact. The 4.51 kN transmitted force confirms its viability as an alternative material."
