# ECM3175 Project Context: FEA of Sustainable Helmet Materials

## Project Scope
Final year BEng Mechanical Engineering dissertation (Exeter University).
Topic: FEA of sustainable helmet materials under EN 397 impact.
Solver: ANSYS LS-DYNA explicit dynamics.
Document: LaTeX (`report/main.tex`)

## Document Structure (Modularized)
The report is split into chapters located in `report/chapters/`:
1. `00-abstract.tex`
2. `01-introduction.tex`
3. `02-literature-review.tex`
4. `03-methodology.tex` (Includes Explicit Dynamics/Central Difference Theory)
5. `04-design.tex` (Material Properties & Mesh Convergence)
6. `05-results.tex` (Phases 1-5 results)
7. `06-discussion.tex` (Final synthesis)
8. `07-project-management.tex` (Gantt Chart, Sustainability, H&S)
9. `99-references.tex`
10. `front-matter.tex` (Title pages)

## Simulation Parameters (The "Golden Source")
- **Methodology:** Galilean upward velocity shift applied to the helmet/headform assembly against a stationary rigid ceiling.
- **Time Integration:** Explicit Central Difference Method (Leapfrog).
- **Stability:** Restricted by CFL condition ($\Delta t \leq L_{min}/c$). Model achieved 0.00 J hourglass energy and < 0.04% energy drift.
- **Mesh Convergence:** 2 mm selected (~42,000 elements). 5.17% stress change from 3 mm to 2 mm.
- **Signal Processing:** SAE J211 CFC 60 (100 Hz cutoff).
- **Contact Physics:** LS-DYNA *Automatic Surface-to-Surface* penalty contact. Penalty stiffness = 0.1. Friction $\mu_{shell-head}=0.3$, $\mu_{shell-ceil}=0.5$.

## Core Technical Data (Material Properties)
- **Units:** Stress in kg/mm², Modulus in GPa, Force in kN, Energy in J, Mass in kg, Length in mm, Time in s.
- **Materials & Properties:** 
  - Virgin HDPE: E=1.00 GPa, Yield=2.55 kg/mm², Etan=0.10 GPa
  - ABS Plastic: E=2.10 GPa, Yield=4.08 kg/mm², Etan=0.50 GPa
  - Bamboo-HDPE (30% wt): E=1.50 GPa, Yield=3.26 kg/mm², Etan=0.30 GPa
  - Recycled PC: E=2.30 GPa, Yield=6.12 kg/mm², Etan=0.60 GPa
- **Pass Criterion:** < 5.0 kN transmitted force.

## Key Results & Advancements
- **Phase 2 (EN 397 Force Transmission):**
  - Virgin HDPE: 4.05 kN (PASS)
  - ABS Plastic: 2.25 kN (PASS)
  - Bamboo-HDPE: 4.51 kN (PASS)
  - Recycled PC: 4.54 kN (PASS)
- **Phase 3 (Energy Absorption Ratio):**
  - Virgin HDPE: 55.3% (27.35 J internal energy)
  - ABS Plastic: 52.8% (26.21 J internal energy)
  - Bamboo-HDPE: 46.1% (22.84 J internal energy)
  - Recycled PC: 33.5% (16.67 J internal energy)
- **Phase 4 (Crush Depth / Max Displacement):**
  - Virgin HDPE: 18.42 mm
  - Bamboo-HDPE: 15.68 mm
  - ABS Plastic: 12.15 mm
  - Recycled PC: 10.23 mm
- **Phase 5 (30° Oblique Impact):**
  - **Virgin HDPE (plastic deformation):** Peak Linear Accel = 87.6 g; Peak Angular Accel = 3482 rad/s²; Peak Contact Pressure = 2.63 kg/mm².
  - **Recycled PC (reduced tangential frictional interaction):** Peak Linear Accel = 91.3 g; Peak Angular Accel = 896 rad/s²; Peak Contact Pressure = 2.69 kg/mm².
  - **Mechanism:** rPC achieves a 74% reduction in rotational acceleration due to its higher flexural modulus limiting localized deformation.
  - **Load Distribution:** High-modulus shells (ABS, rPC) leverage load distribution due to increased flexural stiffness to distribute impact forces across a wider liner area.

## Voice & Tone (Human Persona)
- **Identity:** Final year Mechanical Engineering student. Professional, analytical, and direct.
- **No AI-isms:** Maintained via the custom `ai-slop-checker` skill. Never use "Furthermore," "Moreover," "In conclusion," "It is important to note," or "Delve."
- **Directness:** Use active or passive voice naturally.
- **Nuance:** Acknowledge experimental or simulation limitations. Use engineering-specific hedging.

## LaTeX Environment Mapping & Assets
- Main file: `report/main.tex`
- Graphics path: `report/figures/`
- **Current Status:**
  - Finalized industry-standard Gantt chart.
  - Mesh convergence study results integrated.
  - Phase 1-5 results fully synthesized and integrated into Chapter 5.
  - Section 6 (Discussion) finalized and synthesized with Phase 5 results.
  - Systematic Risk Register completed in Section 8.
  - Technical audit completed; units synchronized (GPa/kg-mm).
  - **First-Class Refinement:** Report completely overhauled to ensure formal academic terminology, a critical literature review, purely descriptive results, and an academically rigorous discussion section. Build configuration optimized to use the `out/` directory.

## Current Sub-Agents & Skills
- `.gemini/agents/report-auditor.md`
- `ai-slop-checker` skill installed and active.
