# Design Specification: ECM3175 Presentation (15-Minute Interview)

## 1. Overview and Purpose
This document specifies the design for a 15-minute academic/technical presentation for the ECM3175 Final Year BEng Mechanical Engineering dissertation module. The presentation accounts for 10% of the module grade and covers the finite element analysis (FEA) of sustainable helmet materials under EN 397 impact testing. The presentation will use the "Problem-Solution Narrative" (Approach A) to balance real-world context with rigorous engineering depth.

## 2. Constraints and Requirements
*   **Duration:** 15 minutes (approx. 12-14 slides to allow 1-1.5 minutes per slide).
*   **Format:** LaTeX Beamer presentation compiled to PDF (aspect ratio 16:9).
*   **Visual Aesthetic:** Modern, clean, and professional (e.g., using the `metropolis` theme or a heavily customized minimal theme).
*   **Tone:** Analytical, professional, direct engineering voice. Strictly no "AI slop" terminology (e.g., "Furthermore", "Delve", "Crucially").
*   **Content:** Must draw exclusively from the provided `session_context` and project data (Phase 1-5 results, material properties, methodology).

## 3. Slide Structure and Narrative Arc
The presentation will follow a logical progression from problem identification to technical methodology, results synthesis, and final conclusions.

*   **Slide 1: Title Slide**
    *   Content: Project title, Name, Module (ECM3175), Institution (Exeter University).
    *   Visual: Minimalist title card, potentially with `exeter_logo.png` if appropriate.
*   **Slide 2: The Problem Context**
    *   Content: Environmental impact of standard PPE (Virgin HDPE). The need for sustainable alternatives without compromising safety-critical regulations (EN 397).
*   **Slide 3: Material Candidates**
    *   Content: Introduction of the four materials: Virgin HDPE (Baseline), ABS Plastic, Bamboo-HDPE (30% wt), Recycled PC.
    *   Data: Brief highlight of Modulus (E) and Yield stress.
*   **Slide 4: Methodology \& Impact Setup**
    *   Content: Galilean upward velocity shift (4.43 m/s) against a rigid ceiling.
    *   Visual: `Assembly_Setup.png` or `model_30_oblique_setup.png`.
*   **Slide 5: Computational Rigor \& Stability**
    *   Content: Explicit Central Difference Method (Leapfrog). CFL stability condition ($\Delta t \leq L_{min}/c$).
    *   Data: Achieved 0.00 J hourglass energy, < 0.04% energy drift. Mesh convergence at 2 mm.
    *   Visual: `mesh_convergence_HDPE.pdf` or `Helmet_Mesh.png`.
*   **Slide 6: Phase 2 - EN 397 Force Transmission**
    *   Content: The primary pass/fail criterion (< 5.0 kN).
    *   Data: All materials pass. Virgin HDPE (4.05 kN), ABS (2.25 kN), Bamboo-HDPE (4.51 kN), rPC (4.54 kN). Mention SAE J211 CFC 60 filtering.
    *   Visual: `Phase2_ForceTransmission_Filtered.pdf`.
*   **Slide 7: Phase 3 \& 4 - Energy Absorption Mechanisms**
    *   Content: How different materials handle the energy.
    *   Mechanism: High ductility (HDPE) = internal strain yielding. High modulus (ABS, rPC) = load distribution via flexural stiffness.
*   **Slide 8: Phase 5 - 30$^\circ$ Oblique Impact**
    *   Content: Introduction to the advanced simulation phase beyond standard EN 397.
    *   Visual: `oblique_setup_view.png`.
*   **Slide 9: Rotational Kinematics (Key Finding)**
    *   Content: The standout result. rPC achieves a 74% reduction in peak rotational acceleration compared to Virgin HDPE.
    *   Mechanism: Reduced tangential frictional interaction due to higher flexural modulus limiting localized surface deformation (unlike plastic deformation in HDPE).
    *   Visual: `stress_oblique_section_rpc.png` vs `stress_oblique_section_hdpe.png`.
*   **Slide 10: Project Management \& Risk**
    *   Content: Brief nod to systematic execution. Adherence to Gantt chart and implementation of a Systematic Risk Register.
    *   Visual: `gantt_image.png` (small, as supporting evidence).
*   **Slide 11: Conclusion**
    *   Content: Final verdict. Sustainable materials (specifically rPC and Bamboo-HDPE) provide sufficient structural protection, meet EN 397, and reduce environmental footprint.
*   **Slide 12: Q\&A**
    *   Content: Standard closing slide.

## 4. Technical Implementation Details (LaTeX Beamer)
*   **Document Class:** `\documentclass[aspectratio=169]{beamer}`
*   **Theme:** `\usetheme{metropolis}` (requires `mtheme` package) or `\usetheme{Boadilla}` stripped of navigation symbols.
*   **Packages:** `graphicx` (for images), `booktabs` (for clean tables), `siunitx` (for correct unit formatting, e.g., \si{kg/mm^2}, \si{kN}), `amsmath`, `hyperref`.
*   **File Structure:** The presentation will be generated as a single standalone `.tex` file (e.g., `presentation/main.tex`) that compiles independently but references the existing `report/figures/` directory.

## 5. Output Deliverables
1.  **LaTeX Source File:** A fully compiling Beamer presentation `.tex` file implementing the design above.
2.  **Speaker Notes:** A separate Markdown document containing structured talking points for each slide, timed to ensure the 15-minute limit is met, and adhering strictly to the required professional tone.

## 6. Self-Review Checklist
*   [x] Does the design fit the 15-minute constraint? Yes (~14 slides).
*   [x] Is the tone specified clearly? Yes (analytical, no AI slop).
*   [x] Are the key technical results included? Yes (force, energy, oblique kinematics).
*   [x] Is the visual aesthetic defined? Yes (16:9 Beamer, metropolis theme, specific figures).
*   [x] Are the deliverables clear? Yes (LaTeX file + Speaker notes).
