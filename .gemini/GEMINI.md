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
- **Phase 5 (30° Oblique Impact):**
  - **Virgin HDPE (plastic deformation):** Peak Rotational Accel = 3482 rad/s²; Peak Contact Pressure = 2.63 kg/mm².
  - **Recycled PC (reduced tangential frictional interaction):** Peak Rotational Accel = 896 rad/s²; Peak Contact Pressure = 2.69 kg/mm².
  - **Mechanism:** rPC achieves a 74% reduction in rotational acceleration due to its higher flexural modulus limiting localized deformation.

## Voice & Tone (Human Persona)
- **Identity:** Final year Mechanical Engineering student.
- **No AI-isms:** Maintained via `ai-slop-checker`. No "Furthermore," "Moreover," "Notably," etc.
- **Directness:** Data-first, professional engineering voice.

## Current Status
- **Modularized:** Content split into chapters for easier navigation.
- **Theoretical Rigor:** Central Difference equations and CFL stability added to Chapter 03.
- **First-Class Refinement:** Report overhauled to enforce formal academic terminology, critical literature review, purely descriptive results, and robust discussion.
- **Technical Audit:** Completed; units synchronized (GPa/kg-mm).
- **Drafting:** `report/draft-1.tex` superseded by finalized modular chapters.
- **Build System:** `report/build.sh` script added to compile cleanly into `report/out/`.

## Current Sub-Agents & Skills
- `.gemini/agents/report-auditor.md`
- `ai-slop-checker` skill installed and active.
