# Report Formatting Compliance Plan

**Objective:** Overhaul the LaTeX report structure and styling to strictly comply with the provided `final report template instructions.pdf`.

**Key Files & Context:**
- `report/main.tex`
- `report/chapters/front-matter.tex`
- `report/chapters/00-abstract.tex`
- `report/chapters/99-references.tex` (or bibliography styling in `main.tex`)

## Discrepancies Identified
1. **Margins & Font Size:** Currently `2.5cm` and `12pt`. Required: `2.54cm` (1 inch) and `11pt` Times New Roman.
2. **Text & Paragraph Spacing:** Currently `1.5` line spacing with default `parskip`. Required: `1.15` line spacing, `6pt` before and after paragraphs, no indentation.
3. **Headings:**
   - *Sections:* Required Arial Bold 16pt, 1.15 spacing, 12pt before/after, 0 indent hanging 0.63cm.
   - *Subsections:* Required Cambria Bold Italic 14pt, 1.5 spacing, 6pt before/after, 0.63cm left indent hanging 0.76cm.
4. **Front Page (Declaration):** Missing logo. Font sizes and "line" placements do not match the rigid Arial 24/15/12/11 structure.
5. **Second Page (Title Page):** Font sizes do not match the Arial 30/20/18 structure.
6. **Abstract Page:** Required to be Times New Roman Italic 11pt (1 spacing) with an Arial Bold 16pt title. Keywords in Times New Roman Italic 12pt.
7. **TOC & References:** Need specific font overrides (Times New Roman 11 for TOC, Times New Roman 10 for references) and specific indentations.

*(Note on Fonts: As the project uses pdfLaTeX, we will approximate Arial using Helvetica (`phv`), Cambria using a standard serif bold-italic (`ptm` or similar), and Times New Roman using `newtxtext`. Precise pt sizes will be set using `\fontsize{X}{Y}\selectfont`.)*

## Implementation Steps

### 1. Global Setup (`main.tex`)
- [ ] Change document class to `11pt`.
- [ ] Update `geometry` to `margin=2.54cm`.
- [ ] Set global line spacing to `1.15` (`\setstretch{1.15}`).
- [ ] Configure paragraph spacing: `\setlength{\parindent}{0pt}`, `\setlength{\parskip}{6pt}` (and adjust space before if needed using custom environment or `titlesec` settings).
- [ ] Use `titlesec` to strictly define `\section` and `\subsection` with the exact fonts, sizes (16pt and 14pt), and hanging indentations specified.
- [ ] Add `tocloft` to format the Table of Contents spacing and indentation.

### 2. Front Pages (`front-matter.tex`)
- [ ] **Page 1:** Rebuild using strict `\vspace` and `\fontsize` commands to mimic the specified lines:
  - University Logo placeholder.
  - "Final Report" (Arial Bold 24).
  - Project Title and Name (Arial Bold 15).
  - "3rd Year Individual Project" (Arial 12).
  - Declaration and Signatures (Arial 11 / Arial Bold 12).
- [ ] **Page 2:** Rebuild:
  - "Final Report" (Arial 30).
  - "ECM3175" (Arial 20).
  - Info fields (Arial 18).

### 3. Abstract (`00-abstract.tex`)
- [ ] Change title to Arial Bold 16pt.
- [ ] Wrap abstract text in an environment that sets Times New Roman Italic 11pt, `\setstretch{1}`, and 6pt before/after spacing.
- [ ] Set keywords to Times Italic 12pt.

### 4. Bibliography (`main.tex` / `99-references.tex`)
- [ ] Change "References" title to Arial Bold 18pt.
- [ ] Inject font changes into the bibliography environment to use Times New Roman 10pt, `\setstretch{1}`, and 0.76cm hanging indent.

## Verification & Testing
- Compile using `build.sh`.
- Visually inspect the generated `out/main.pdf` to ensure the front pages, abstract, TOC, main text, and references visually align with the strict size, spacing, and indent rules outlined in the template instructions.