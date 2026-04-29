# Chapter 4: Design and Setup - Implementation Plan

## Objective
To enhance the Design chapter by explicitly detailing the constitutive material models used in the LS-DYNA solver. This demonstrates a deep understanding of how physical polymers are mathematically represented in the finite element environment.

## Step 1: Add New BibTeX Entry
Ensure the LS-DYNA Keyword Manual is referenced for the material models.

```bibtex
@manual{lsdyna_keyword,
  title={LS-DYNA Keyword User's Manual},
  organization={Livermore Software Technology Corporation (LSTC)},
  year={2021},
  url={https://lsdyna.ansys.com/}
}
```

## Step 2: Expand Section 4.X (Constitutive Material Modelling)
**Action:** Add a dedicated subsection detailing `*MAT_024` for the shells and `*MAT_063` for the EPS liner.

**Proposed Text Addition (to be inserted into the Design chapter):**
> \section{Constitutive Material Modelling}
> Accurate FEA of transient impacts requires robust constitutive models that capture both the elastic and post-yield behavior of the polymers. 
> 
> \subsection{Thermoplastic Shells (\texttt{*MAT\_024})}
> The outer structural shells (Virgin HDPE, ABS, Bamboo-HDPE, and Recycled PC) were modelled using LS-DYNA's \texttt{*MAT\_PIECEWISE\_LINEAR\_PLASTICITY} (\texttt{*MAT\_024})~\cite{lsdyna_keyword}. This constitutes an elasto-plastic material model that evaluates yielding based on the von Mises criterion. The model relies on the input of a defined yield stress ($\sigma_y$) and an arbitrary isotropic hardening curve, which was approximated using the Tangent Modulus ($E_{tan}$). For stress states exceeding the yield threshold, the flow rule allows for permanent plastic deformation while maintaining volume constancy (incompressibility in the plastic domain). This model is highly effective for thin-walled structures undergoing localized yielding, as observed in the HDPE drop tests.
> 
> \subsection{Energy-Absorbing Liner (\texttt{*MAT\_063})}
> The Expanded Polystyrene (EPS) liner required a fundamentally different mathematical approach. Unlike the incompressible plastic flow of the shell, foams undergo massive permanent volumetric reduction. Consequently, the liner was modelled using \texttt{*MAT\_CRUSHABLE\_FOAM} (\texttt{*MAT\_063})~\cite{lsdyna_keyword}. This model decouples the volumetric and deviatoric responses. 
> 
> The compressive behavior is governed by a user-defined stress versus volumetric strain curve. Volumetric strain is defined directly by relative volume compaction ($\varepsilon_v = 1 - V/V_0$). Unloading is treated as purely elastic up to a specified tension cut-off, reflecting the physical reality that EPS foam absorbs energy through irreversible cellular collapse but provides minimal resistance to tensile forces.

## Step 3: Review and Compile
**Action:** Run the `report/build.sh` script to ensure the new formatting and citations compile cleanly.