# ECM3175 Presentation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a 15-minute academic LaTeX Beamer presentation and accompanying speaker notes for the ECM3175 Final Year BEng Mechanical Engineering dissertation.

**Architecture:** A standalone LaTeX file using the `beamer` class with the `metropolis` theme (or customized modern theme), compiling to a 16:9 PDF. A separate Markdown file will contain the timed speaker notes.

**Tech Stack:** LaTeX, Beamer, Markdown.

---

### Task 1: Setup LaTeX Presentation Structure and Title Slide

**Files:**
- Create: `presentation/main.tex`

- [ ] **Step 1: Write initial Beamer setup and title slide**

```latex
\documentclass[aspectratio=169]{beamer}
\usetheme{metropolis}
\usepackage{graphicx}
\usepackage{booktabs}
\usepackage{siunitx}
\usepackage{amsmath}
\usepackage{hyperref}

\graphicspath{{../report/figures/}}

\title{FEA of Sustainable Helmet Materials}
\subtitle{under EN 397 Impact}
\author{Your Name}
\institute{ECM3175 Final Year BEng Mechanical Engineering\\University of Exeter}
\date{April 2026}

\begin{document}

\begin{frame}
  \titlepage
\end{frame}

\end{document}
```

- [ ] **Step 2: Create presentation directory and write file**

Run: `mkdir -p presentation`

- [ ] **Step 3: Commit**

```bash
git add presentation/main.tex
git commit -m "feat: initialize presentation structure and title slide"
```

### Task 2: Problem Context & Material Candidates Slides

**Files:**
- Modify: `presentation/main.tex`

- [ ] **Step 1: Add Problem Context and Material Candidates frames before `\end{document}`**

```latex
\begin{frame}{The Problem Context}
  \begin{itemize}
    \item \textbf{Environmental Impact:} Standard PPE (e.g., Virgin HDPE) has a high environmental cost.
    \item \textbf{The Challenge:} Transitioning to sustainable alternatives without compromising safety.
    \item \textbf{Regulatory Standard:} EN 397 is the safety-critical regulation for industrial helmets.
  \end{itemize}
\end{frame}

\begin{frame}{Material Candidates}
  \begin{table}
    \centering
    \begin{tabular}{lcc}
      \toprule
      \textbf{Material} & \textbf{Modulus (GPa)} & \textbf{Yield Stress (\si{kg/mm^2})} \\
      \midrule
      Virgin HDPE (Baseline) & 1.00 & 2.55 \\
      ABS Plastic & 2.10 & 4.08 \\
      Bamboo-HDPE (30\% wt) & 1.50 & 3.26 \\
      Recycled PC (rPC) & 2.30 & 6.12 \\
      \bottomrule
    \end{tabular}
  \end{table}
\end{frame}
```

- [ ] **Step 2: Commit**

```bash
git add presentation/main.tex
git commit -m "feat: add problem context and material candidates slides"
```

### Task 3: Methodology & Computational Rigor Slides

**Files:**
- Modify: `presentation/main.tex`

- [ ] **Step 1: Add Methodology and Rigor frames**

```latex
\begin{frame}{Methodology \& Impact Setup}
  \begin{columns}
    \begin{column}{0.5\textwidth}
      \begin{itemize}
        \item \textbf{Setup:} Galilean upward velocity shift applied to helmet/headform.
        \item \textbf{Velocity:} \SI{4.43}{m/s} against a rigid ceiling.
        \item \textbf{Solver:} LS-DYNA Explicit Dynamics.
      \end{itemize}
    \end{column}
    \begin{column}{0.5\textwidth}
      \centering
      % Assuming Assembly_Setup.png exists, adjust if using model_30_oblique_setup.png
      \includegraphics[width=\textwidth]{model_30_oblique_setup.png}
    \end{column}
  \end{columns}
\end{frame}

\begin{frame}{Computational Rigor \& Stability}
  \begin{columns}
    \begin{column}{0.5\textwidth}
      \begin{itemize}
        \item \textbf{Time Integration:} Explicit Central Difference Method.
        \item \textbf{Stability:} CFL condition ($\Delta t \leq L_{min}/c$).
        \item \textbf{Validation:} \SI{0.00}{J} hourglass energy, $< 0.04\%$ energy drift.
        \item \textbf{Mesh:} Convergence achieved at \SI{2}{mm} (~42,000 elements).
      \end{itemize}
    \end{column}
    \begin{column}{0.5\textwidth}
      \centering
      \includegraphics[width=\textwidth]{Helmet_Mesh.png}
    \end{column}
  \end{columns}
\end{frame}
```

- [ ] **Step 2: Commit**

```bash
git add presentation/main.tex
git commit -m "feat: add methodology and computational rigor slides"
```

### Task 4: Phase 2 - Force Transmission Slide

**Files:**
- Modify: `presentation/main.tex`

- [ ] **Step 1: Add Phase 2 frame**

```latex
\begin{frame}{Phase 2: EN 397 Force Transmission}
  \begin{columns}
    \begin{column}{0.5\textwidth}
      \begin{itemize}
        \item \textbf{Criterion:} Transmitted force must be $< \SI{5.0}{kN}$.
        \item \textbf{Results:} All materials pass.
        \begin{itemize}
          \item Virgin HDPE: \SI{4.05}{kN}
          \item ABS: \SI{2.25}{kN}
          \item Bamboo-HDPE: \SI{4.51}{kN}
          \item Recycled PC: \SI{4.54}{kN}
        \end{itemize}
        \item \textbf{Signal Processing:} Data filtered using SAE J211 CFC 60 to isolate macroscopic deceleration.
      \end{itemize}
    \end{column}
    \begin{column}{0.5\textwidth}
      \centering
      \includegraphics[width=\textwidth]{Phase2_ForceTransmission_Filtered.pdf}
    \end{column}
  \end{columns}
\end{frame}
```

- [ ] **Step 2: Commit**

```bash
git add presentation/main.tex
git commit -m "feat: add phase 2 force transmission slide"
```

### Task 5: Phase 3 & 4 - Energy Absorption Slide

**Files:**
- Modify: `presentation/main.tex`

- [ ] **Step 1: Add Phase 3 & 4 frame**

```latex
\begin{frame}{Phases 3 \& 4: Energy Absorption Mechanisms}
  \begin{itemize}
    \item \textbf{High Ductility (Virgin HDPE):}
      \begin{itemize}
        \item Absorbs impact energy primarily through internal strain yielding and plastic deformation.
        \item Energy Absorption Ratio: 55.3\%.
        \item Crush Depth: \SI{18.42}{mm}.
      \end{itemize}
    \item \textbf{High Modulus (ABS, rPC):}
      \begin{itemize}
        \item Relies on load distribution due to increased flexural stiffness, distributing forces across a wider EPS liner area.
        \item rPC Energy Absorption Ratio: 33.5\%, Crush Depth: \SI{10.23}{mm}.
      \end{itemize}
  \end{itemize}
\end{frame}
```

- [ ] **Step 2: Commit**

```bash
git add presentation/main.tex
git commit -m "feat: add energy absorption mechanisms slide"
```

### Task 6: Phase 5 - Oblique Impact & Kinematics Slides

**Files:**
- Modify: `presentation/main.tex`

- [ ] **Step 1: Add Phase 5 frames**

```latex
\begin{frame}{Phase 5: 30$^\circ$ Oblique Impact}
  \begin{columns}
    \begin{column}{0.5\textwidth}
      \begin{itemize}
        \item \textbf{Objective:} Advanced simulation beyond standard EN 397 to evaluate real-world complex impacts.
        \item \textbf{Setup:} 30$^\circ$ angled impact surface.
        \item \textbf{Focus:} Rotational kinematics and tangential frictional interactions.
      \end{itemize}
    \end{column}
    \begin{column}{0.5\textwidth}
      \centering
      \includegraphics[width=\textwidth]{oblique_setup_view.png}
    \end{column}
  \end{columns}
\end{frame}

\begin{frame}{Rotational Kinematics (Key Finding)}
  \begin{columns}
    \begin{column}{0.5\textwidth}
      \begin{itemize}
        \item \textbf{rPC Performance:} Achieved a 74\% reduction in peak rotational acceleration compared to Virgin HDPE (\SI{896}{rad/s^2} vs \SI{3482}{rad/s^2}).
        \item \textbf{Mechanism:} Reduced tangential frictional interaction. Higher flexural modulus limits localized surface deformation, unlike the plastic deformation seen in HDPE.
      \end{itemize}
    \end{column}
    \begin{column}{0.5\textwidth}
      \centering
      \includegraphics[width=0.8\textwidth]{stress_oblique_section_rpc.png}\\
      \vspace{0.2cm}
      \includegraphics[width=0.8\textwidth]{stress_oblique_section_hdpe.png}
    \end{column}
  \end{columns}
\end{frame}
```

- [ ] **Step 2: Commit**

```bash
git add presentation/main.tex
git commit -m "feat: add oblique impact and rotational kinematics slides"
```

### Task 7: Project Management & Conclusion Slides

**Files:**
- Modify: `presentation/main.tex`

- [ ] **Step 1: Add Project Management, Conclusion and Q\&A frames**

```latex
\begin{frame}{Project Management \& Risk}
  \begin{columns}
    \begin{column}{0.5\textwidth}
      \begin{itemize}
        \item \textbf{Execution:} Systematic adherence to the project Gantt chart.
        \item \textbf{Safety:} Implementation of a comprehensive Systematic Risk Register.
        \item \textbf{Audit:} Units synchronized across all models (\si{GPa}/\si{kg/mm^2}).
      \end{itemize}
    \end{column}
    \begin{column}{0.5\textwidth}
      \centering
      \includegraphics[width=\textwidth]{gantt_image.png}
    \end{column}
  \end{columns}
\end{frame}

\begin{frame}{Conclusion}
  \begin{itemize}
    \item \textbf{Validation:} Sustainable alternatives (rPC, Bamboo-HDPE) provide sufficient structural protection and meet strict EN 397 regulations.
    \item \textbf{Superiority in Complex Impacts:} rPC outperforms traditional materials in oblique impacts by mitigating rotational acceleration.
    \item \textbf{Impact:} Significant reduction in the environmental footprint of PPE without compromising safety-critical performance.
  \end{itemize}
\end{frame}

\begin{frame}
  \centering
  \Huge \textbf{Questions?}
\end{frame}
```

- [ ] **Step 2: Commit**

```bash
git add presentation/main.tex
git commit -m "feat: add project management, conclusion, and QnA slides"
```

### Task 8: Compile the Presentation

**Files:**
- None created, just compile.

- [ ] **Step 1: Run pdflatex (or latexmk) to ensure the file compiles.**

Run: `cd presentation && pdflatex main.tex && pdflatex main.tex`
Expected: PDF is generated without fatal errors.

- [ ] **Step 2: Commit generated PDF (if required) or just verify compilation.**

### Task 9: Generate Speaker Notes

**Files:**
- Create: `presentation/speaker_notes.md`

- [ ] **Step 1: Write speaker notes Markdown file**

```markdown
# Speaker Notes: ECM3175 Presentation (15 Minutes)

## Slide 1: Title Slide (0:00 - 0:30)
- "Good morning. My name is [Your Name], and today I will present the findings of my ECM3175 Final Year BEng Mechanical Engineering dissertation."
- "My research focused on the Finite Element Analysis of sustainable helmet materials under the EN 397 impact standard."

## Slide 2: The Problem Context (0:30 - 1:30)
- "The industrial PPE sector heavily relies on Virgin High-Density Polyethylene, which carries a significant environmental footprint."
- "The primary challenge of this project was to evaluate sustainable alternatives to see if they can reduce environmental impact without compromising safety."
- "The benchmark for this safety is the EN 397 standard, a rigorous regulation for industrial safety helmets."

## Slide 3: Material Candidates (1:30 - 2:30)
- "We analyzed four material models."
- "Virgin HDPE served as our baseline. We also tested standard ABS plastic."
- "Our sustainable candidates were a Bamboo-HDPE composite with 30% weight fraction, and Recycled Polycarbonate (rPC)."
- "Note the variations in elastic modulus and yield stress—these properties dictated their energy absorption behavior."

## Slide 4: Methodology & Impact Setup (2:30 - 3:30)
- "The simulation utilized LS-DYNA Explicit Dynamics."
- "Based on Galilean Invariance, we applied an upward velocity shift of 4.43 m/s to the helmet and headform assembly, impacting against a stationary rigid ceiling."
- "This mimics the 49 Joules impact energy required by EN 397."

## Slide 5: Computational Rigor & Stability (3:30 - 5:00)
- "To ensure the validity of our findings, we prioritized computational stability."
- "We employed the Explicit Central Difference Method. Stability was governed by the CFL condition, ensuring our timestep remained below the critical threshold."
- "The model was highly stable: we recorded 0.00 Joules of hourglass energy and an energy drift of less than 0.04%."
- "Mesh convergence was achieved at 2 mm, yielding approximately 42,000 elements."

## Slide 6: Phase 2 - EN 397 Force Transmission (5:00 - 6:30)
- "Phase 2 was the critical EN 397 test. The pass criterion is a transmitted force of less than 5.0 kN."
- "All materials passed. Virgin HDPE transmitted 4.05 kN, while ABS transmitted 2.25 kN."
- "Crucially, our sustainable alternatives also passed: Bamboo-HDPE at 4.51 kN and rPC at 4.54 kN."
- "Raw nodal acceleration data was filtered using SAE J211 CFC 60 to isolate the true structural deceleration from high-frequency numerical contact noise."

## Slide 7: Phases 3 & 4 - Energy Absorption Mechanisms (6:30 - 8:30)
- "Phases 3 and 4 revealed two distinct energy absorption mechanisms."
- "Highly ductile polymers, like Virgin HDPE, absorbed impact energy primarily through internal strain yielding and localized plastic deformation, resulting in a deeper crush depth of 18.42 mm."
- "Conversely, high-modulus materials like ABS and rPC relied on their increased flexural stiffness. This allowed them to distribute the impact forces across a wider surface area of the EPS liner, reducing the crush depth."

## Slide 8: Phase 5 - 30 Degree Oblique Impact (8:30 - 10:00)
- "We extended the analysis beyond EN 397 to evaluate real-world, complex impacts using a 30-degree oblique impact surface."
- "This phase focused specifically on rotational kinematics, which are closely linked to traumatic brain injuries."

## Slide 9: Rotational Kinematics (Key Finding) (10:00 - 12:00)
- "This was our standout finding."
- "Recycled PC achieved a massive 74% reduction in peak rotational acceleration compared to Virgin HDPE—dropping from 3482 to 896 rad/s^2."
- "The mechanism driving this is reduced tangential frictional interaction. The higher flexural modulus of rPC limits localized surface deformation, allowing the helmet to deflect the tangential force rather than undergoing the severe plastic deformation observed in HDPE."

## Slide 10: Project Management & Risk (12:00 - 13:00)
- "The success of this project was underpinned by rigorous management."
- "We adhered strictly to our industry-standard Gantt chart and maintained a comprehensive Systematic Risk Register."
- "A final technical audit ensured all units, such as GPa and kg/mm^2, were synchronized perfectly across all models."

## Slide 11: Conclusion (13:00 - 14:30)
- "To conclude, our results validate that sustainable material alternatives—particularly Recycled PC and Bamboo-HDPE—provide sufficient structural protection."
- "They meet the strict EN 397 regulations and offer superior performance in mitigating rotational acceleration during complex impacts."
- "These alternatives present a viable pathway to significantly reduce the environmental footprint of PPE production without compromising safety."

## Slide 12: Questions (14:30 - 15:00)
- "Thank you for your time. I welcome any questions you may have."
```

- [ ] **Step 2: Commit**

```bash
git add presentation/speaker_notes.md
git commit -m "docs: generate speaker notes for presentation"
```
