# ECM3175 Final Dissertation: Academic Enhancement TODO

## Priority 1: Chapter 03 (Methodology & Theory) - Goal: +3 Pages
- [ ] **Penalty Contact Theory:** Draft 1.5 pages on the mathematics of LS-DYNA contact. Include the penalty spring equation $F = k \delta$ and discuss the selection of the 0.1 stiffness factor.
- [ ] **CFL Stability Derivation:** Expand the state-of-the-art derivation. Explicitly link the $0.42~\mu s$ time step to the longitudinal wave speed $c = \sqrt{E/\rho}$ for HDPE and Recycled PC.
- [ ] **Hourglassing Physics:** Add a sub-section on zero-energy deformation modes and why Type 4 Viscous control was required for the 4-node shell elements.

## Priority 2: Chapter 04 (Design & Setup) - Goal: +1.5 Pages
- [ ] **Detailed Mesh Audit:** Create a table or discussion on Jacobian ratios and warping factors for the 2mm helmet mesh.
- [ ] **Friction Justification:** Add a critical paragraph justifying $\mu=0.3$ and $\mu=0.5$ using polymer-on-metal friction literature.

## Priority 3: Chapter 06 (Discussion) - Goal: +1 Page
- [ ] **Brain Injury Correlation:** Link the peak angular acceleration results (Phase 5) to the Brain Injury Criterion (BrIC). Compare the 74% reduction in rPC to medical thresholds for concussive injury.
- [ ] **Material Science Depth:** Discuss the "Chain Scission" effect in recycled polymers and how it explains the high stiffness/low energy absorption observed in the rPC results.

## Final Review
- [ ] Run `report/audit.sh` one last time.
- [ ] Check total page count (Aiming for 33-35 pages).
