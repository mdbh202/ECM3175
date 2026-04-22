# Visual Integration Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Integrate the selected high-fidelity CAD and simulation screenshots into the LaTeX report to provide robust visual evidence for the mechanical findings.

**Architecture:** The selected screenshots will be renamed to descriptive, LaTeX-friendly filenames and moved to the `report/figures/` directory. The corresponding `.tex` files (`04-design.tex` and `05-results.tex`) will then be updated to reference these new figures, replacing generic placeholders and adding comparative views.

**Tech Stack:** LaTeX, Bash (for file operations)

---

### Task 1: Organize and Rename Screenshots

**Files:**
- Move & Rename: Various files from `report/Screenshots/` to `report/figures/`

- [ ] **Step 1: Copy and rename the Design chapter CAD images**

```bash
cp "report/Screenshots/Screenshot 2026-03-17 134557.png" "report/figures/cad_isometric.png"
cp "report/Screenshots/Screenshot 2026-03-17 135209.png" "report/figures/cad_section_liner.png"
cp "report/Screenshots/Screenshot 2026-03-17 134812.png" "report/figures/cad_impact_setup.png"
```

- [ ] **Step 2: Copy and rename the Results chapter simulation images**

```bash
# Phase 4: EPS Strain Section Views
cp "report/Screenshots/HDPE/Screenshot 2026-03-04 132215.png" "report/figures/strain_section_hdpe.png"
cp "report/Screenshots/RECYCLED PC/Screenshot 2026-03-04 125830.png" "report/figures/strain_section_rpc.png"

# Phase 5: Oblique Impact Stress Section Views
cp "report/Screenshots/HDPE/Screenshot 2026-03-04 132225.png" "report/figures/stress_oblique_section_hdpe.png"
cp "report/Screenshots/RECYCLED PC/Screenshot 2026-03-04 125403.png" "report/figures/stress_oblique_section_rpc.png"

# Synthesis: Top View Stress Footprints
cp "report/Screenshots/HDPE/Screenshot 2026-03-04 133300.png" "report/figures/stress_top_hdpe.png"
cp "report/Screenshots/ABS/Screenshot 2026-03-02 132432.png" "report/figures/stress_top_abs.png"
cp "report/Screenshots/BAMBOO HDPE/Screenshot 2026-03-02 141535.png" "report/figures/stress_top_bamboo.png"
cp "report/Screenshots/RECYCLED PC/Screenshot 2026-03-04 125422.png" "report/figures/stress_top_rpc.png"
```

- [ ] **Step 3: Verify files exist in figures directory**

Run: `ls report/figures/ | grep -E "cad_|strain_|stress_"`
Expected: All newly named `.png` files should be listed.

### Task 2: Update Design Chapter (04-design.tex)

**Files:**
- Modify: `report/chapters/04-design.tex`

- [ ] **Step 1: Replace Fig 4.1 with High-Fidelity CAD**

Modify `\includegraphics[width=0.7\textwidth]{Helmet_CAD_Model.png}` to `\includegraphics[width=0.7\textwidth]{cad_isometric.png}`.

- [ ] **Step 2: Add Assembly Internal View Figure**

Add a new figure block right after Fig 4.1 to show the EPS liner section view using `cad_section_liner.png`. Include a descriptive caption referencing the EPS liner interface.

- [ ] **Step 3: Update Impact Setup Figure**

Modify Fig 4.2 (`Assembly_Setup.png`) to use the new top view `cad_impact_setup.png`. Update the caption to match the new perspective.

### Task 3: Update Results Chapter (05-results.tex)

**Files:**
- Modify: `report/chapters/05-results.tex`

- [ ] **Step 1: Add Phase 4 Comparative Strain Figures**

In Section "Phase 4: Kinematic Displacement and Structural Crush Depth", add a side-by-side subfigure comparing `strain_section_hdpe.png` and `strain_section_rpc.png` to visually demonstrate the "Snowshoe Effect" before the text that mentions it.

- [ ] **Step 2: Update Phase 5 Oblique Stress Figures**

Replace the subfigures in Figure 5.4 (`Stress_Contours.png`) with the specific `stress_oblique_section_hdpe.png` and `stress_oblique_section_rpc.png` to show the ductile smearing vs. rigid skidding responses.

- [ ] **Step 3: Add Synthesis Stress Footprint Figure**

At the end of the Results chapter, add a new 2x2 subfigure grid comparing the peak stress footprints for all four materials (`stress_top_hdpe.png`, `stress_top_abs.png`, `stress_top_bamboo.png`, `stress_top_rpc.png`). Add a summarizing paragraph explaining how the high-modulus materials exhibit a wider stress footprint while baseline HDPE concentrates the stress.

### Task 4: Compile and Validate LaTeX

**Files:**
- Read: `report/main.tex`

- [ ] **Step 1: Compile the document**

Run: `cd report && pdflatex main.tex` (or the appropriate build command for the project).
Expected: Successful compilation with no missing figure errors.

- [ ] **Step 2: Commit the changes**

```bash
git add report/figures/cad_*.png report/figures/strain_*.png report/figures/stress_*.png
git add report/chapters/04-design.tex report/chapters/05-results.tex
git commit -m "feat: integrate CAD and simulation screenshots into report"
```