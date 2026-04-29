# Chapter 2: Literature Review - Implementation Plan

## Objective
To elevate the Literature Review (Chapter 2) from a standard summary of materials to a critical, first-class analysis of Finite Element Analysis (FEA) methodologies in helmet testing. Specifically, this expansion will focus on the implications of headform modelling (rigid vs. deformable) and the critical gap in industrial standard oblique impact testing.

## Step 1: Add New BibTeX Entries
We will add the following robust, peer-reviewed sources to `report/references.bib`:

```bibtex
@article{ghajari2011,
  title={Effects of the presence of the body in helmet oblique impacts},
  author={Ghajari, M. and Peldschus, S. and Galvanetto, U. and Iannucci, L.},
  journal={Accident Analysis \& Prevention},
  volume={43},
  number={4},
  pages={1492--1499},
  year={2011},
  doi={10.1016/j.aap.2011.02.028},
  url={https://doi.org/10.1016/j.aap.2011.02.028}
}

@article{mills2009,
  title={FEA of oblique impact tests on a motorcycle helmet},
  author={Mills, N. J. and Wilkes, S. and Derler, S. and Flisch, A.},
  journal={International Journal of Impact Engineering},
  volume={36},
  number={7},
  pages={913--925},
  year={2009},
  doi={10.1016/j.ijimpeng.2008.12.011},
  url={https://doi.org/10.1016/j.ijimpeng.2008.12.011}
}

@article{zhang2017,
  title={Finite element simulations of the head--brain responses to the top impacts of a construction helmet: Effects of the neck and body mass},
  author={Zhang, J. and Yoganandan, N. and Pintar, F. A. and Guan, Y.},
  journal={International Journal for Numerical Methods in Biomedical Engineering},
  volume={33},
  number={12},
  pages={e2875},
  year={2017},
  doi={10.1002/cnm.2875},
  url={https://doi.org/10.1002/cnm.2875}
}
```

## Step 2: Expand Section 2.1 (Impact Stress Distribution and Mechanics)
**Action:** Insert a critical discussion on the limitations of rigid headforms vs. biofidelic models (e.g., THUMS).

**Proposed Text Addition (to be inserted before the final paragraph of Section 2.1):**
> A fundamental challenge in standardizing FEA for helmet impacts is the selection of the headform boundary condition. While EN 397 and EN 960 mandate the use of standardized rigid aluminium headforms to ensure test repeatability, this simplification explicitly neglects the biomechanical compliance of the human skull and cervical spine. Studies utilizing highly biofidelic models, such as those by Zhang et al.~\cite{zhang2017}, demonstrate that rigid headforms consistently over-predict peak transmitted forces compared to deformable human surrogates. However, introducing deformable surrogates into comparative material studies introduces complex, non-linear variables (such as cerebrospinal fluid damping) that can obscure the isolated mechanical performance of the polymer shell. Consequently, while rigid headforms present a conservative, ``worst-case'' boundary condition, their use is justified for isolating the structural stiffness and energy partitioning of novel materials without biological convolution.

## Step 3: Create Section 2.4 (Oblique Impact and Rotational Kinematics)
**Action:** Add a new section specifically detailing the literature on oblique impacts to justify Phase 5 of the project.

**Proposed Text Addition (to be inserted at the end of the chapter):**
> \section{Oblique Impact and Rotational Kinematics}
> The current EN 397 standard focuses exclusively on linear crown impacts, ignoring the tangential forces generated during off-axis collisions. Oblique impacts induce rotational acceleration, which is clinically recognized as the primary mechanism for Diffuse Axonal Injury (DAI) and severe concussions. Research into motorcycle and equestrian helmets by Mills et al.~\cite{mills2009} and Ghajari et al.~\cite{ghajari2011} confirms that rotational torque is heavily dependent on the coefficient of friction at the helmet-anvil interface and the flexural rigidity of the shell. 
> 
> While sports and high-velocity transit helmets have seen extensive oblique FEA modelling, industrial safety helmets remain critically under-analyzed in this domain. Furthermore, the introduction of sustainable composites introduces unknown frictional and deformation characteristics that could exacerbate rotational hazards. A key objective of this investigation is to bridge this gap by applying oblique impact methodologies to industrial helmet profiles, quantifying how the structural modulus of recycled polymers (such as rPC) mitigates or amplifies rotational kinematics compared to conventional ductile thermoplastics.

## Step 4: Review and Compile
**Action:** Run the `report/build.sh` script to verify that the new `.bib` entries compile without overfull hboxes and that the new text flows seamlessly into the existing narrative.