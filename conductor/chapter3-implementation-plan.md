# Chapter 3: Methodology - Implementation Plan

## Objective
To elevate the Methodology chapter by introducing the mathematical rigor behind LS-DYNA's contact mechanics. This will shift the text from merely stating *what* was done to proving an academic understanding of *how* the solver computes interactions, aligning with the high standard seen in top-tier sample reports.

## Step 1: Add New BibTeX Entries
We will add the foundational LS-DYNA theoretical documentation to `report/references.bib`:

```bibtex
@manual{lsdyna_theory,
  title={LS-DYNA Theory Manual},
  author={Hallquist, J. O.},
  organization={Livermore Software Technology Corporation (LSTC)},
  year={2006},
  url={https://ftp.lstc.com/anonymous/outgoing/jday/manuals/LS-DYNA_Theory_Manual_2006.pdf}
}

@article{belytschko1992,
  title={High performance algorithms for the solution of general contact-impact problems},
  author={Belytschko, T. and Neal, M. O.},
  journal={Nuclear Engineering and Design},
  volume={138},
  number={1},
  pages={65--74},
  year={1992},
  doi={10.1016/0029-5493(92)90279-5}
}
```

## Step 2: Expand Section 3.X (Contact Mechanics and Penalty Formulation)
**Action:** Insert the mathematical derivations for the penalty contact algorithm.

**Proposed Text Addition (to be inserted into the Methodology chapter):**
> \section{Contact Mechanics and the Penalty Formulation}
> The interaction between the helmet shell, the EPS liner, and the rigid headform was governed by LS-DYNA's \texttt{*AUTOMATIC\_SURFACE\_TO\_SURFACE} algorithm. To prevent non-physical nodal penetration, this algorithm employs a penalty-based formulation. When a slave node penetrates a master segment, an elastic compression-only spring is dynamically instantiated between them to resist the penetration~\cite{belytschko1992}.
> 
> The contact force vector, $\mathbf{F}_c$, applied to the penetrating node is proportional to the penetration depth, $\delta$:
> \begin{equation}
>     \mathbf{F}_c = k_c \cdot \delta \cdot \mathbf{n}
> \end{equation}
> where $\mathbf{n}$ is the unit normal vector of the master segment, and $k_c$ is the interface contact stiffness. For solid elements, LS-DYNA derives this stiffness based on the bulk modulus of the interacting materials:
> \begin{equation}
>     k_c = \frac{f_s \cdot K \cdot A}{V}
> \end{equation}
> where $K$ is the bulk modulus of the slave element, $A$ is the segment face area, $V$ is the element volume, and $f_s$ is the penalty scale factor~\cite{lsdyna_theory}. 
> 
> In this investigation, a penalty scale factor ($f_s$) of 0.1 was utilized. This value optimizes the balance between enforcing kinematic constraints (preventing unphysical mesh overlap) and maintaining thermodynamic stability. Higher penalty factors artificially stiffen the contact interface, potentially driving the required explicit time-step below the Courant-Friedrichs-Lewy (CFL) stability limit and inducing catastrophic high-frequency noise.

## Step 3: Review and Compile
**Action:** Run the `report/build.sh` script to verify that the equations compile correctly and the formatting holds.