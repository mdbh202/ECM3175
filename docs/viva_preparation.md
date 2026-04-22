---
title: ECM3175 Viva & Defense Preparation
tags: [viva, defense, ecm3175, fea, ls-dyna, sustainability]
date: 2026-04-12
---

# ECM3175 Viva / Defense Preparation Q&A

This document compiles potential interview questions from supervisors (viva/defense panel) regarding the "FEA of Sustainable Helmet Materials" dissertation, along with first-class, evidence-backed answers.

## 🧠 Category 1: FEA Methodology & Explicit Dynamics

**Q1: Why did you choose an explicit solver (LS-DYNA) over an implicit one for this analysis?**
**Your Answer:** "Implicit solvers require global stiffness matrix inversions, which struggle to converge in highly non-linear, millisecond-duration events involving complex contact and massive deformation. Explicit dynamics uses the Central Difference Method to solve kinematic equations of motion directly frame-by-frame. This makes it computationally efficient and perfectly suited for the transient shock waves of a 49 Joules drop test."

**Q2: You used a 'Galilean Invariance' kinematic shift. Can you explain what that is and why you didn't just drop the helmet?**
**Your Answer:** "Instead of dropping a 5.0 kg mass through empty space, I assigned a 4.43 m/s upward velocity to the helmet and headform against a stationary ceiling. Physically, the impact energy ($E_k = \frac{1}{2}mv^2$) is mathematically identical at the moment of contact. Computationally, this completely eliminates the 'free-flight' processing time. Because the impact only lasts 8-10 milliseconds, the omitted gravity acceleration contributes less than 0.2% to the total impulse, making this a highly stable and efficient optimization."

**Q3: Your mesh convergence study accepted a 5.17% stress change between the 3mm and 2mm mesh. The standard academic threshold is 5%. How do you justify this?**
**Your Answer:** "In explicit dynamics, you must balance spatial discretization (mesh size) with temporal stability. The solver's time-step is strictly governed by the Courant-Friedrichs-Lewy (CFL) condition ($\Delta t \leq L_{min}/c$). If I refined the mesh to 1mm to chase a perfect <5% convergence, the time-step would plummet, exponentially increasing computational cost and the risk of numerical instability. The 2mm mesh gave me a stable 0.42 $\mu s$ time-step and exactly 0.00 J of hourglass energy, which is a highly acceptable engineering trade-off."

---

## 🔬 Category 2: Material Mechanics & Rotational Kinematics

**Q4: You modeled the 30% Bamboo-HDPE composite as an 'isotropic' material. Is that realistic, and how did it affect your Phase 5 results?**
**Your Answer:** "It is a simplifying assumption. A 30% random short-fiber distribution promotes quasi-isotropic behavior, but in reality, the true transverse modulus is likely lower. In off-axis directions, my model likely overestimates the stiffness. During the 30-degree oblique impact, this artificial stiffness probably inflated the contact friction, potentially overestimating that massive 12,044 rad/s² peak angular acceleration by 15-20%. Modeling it as orthotropic is my primary recommendation for future work."

**Q5: Can you explain the 'Snowshoe Effect' you observed in the high-modulus materials?**
**Your Answer:** "Virgin HDPE is ductile—it absorbs energy by yielding and permanently deforming. High-modulus materials like Recycled PC and ABS don't yield easily. Instead, their high flexural rigidity acts like a snowshoe, distributing the localized impact force across a much wider surface area of the underlying EPS liner. It protects the skull, but it acts more like an elastic spring, which is why the rPC shell showed a 54.2% elastic rebound."

**Q6: In Phase 5, you detail 'Rigid Skidding' versus 'Ductile Smearing'. Why do these mechanisms matter for safety helmets?**
**Your Answer:** "Standard vertical impacts cause skull fractures, but oblique (angled) impacts cause the brain to twist, leading to Diffuse Axonal Injury (DAI). Because Virgin HDPE is ductile, it yields and 'smears' against the angled surface, increasing friction and violently twisting the headform (3482 rad/s²). Recycled PC is incredibly stiff; it resists local deformation and simply 'skids' across the surface. This skidding reduced the rotational 'grab', achieving a 74% reduction in peak rotational acceleration (896 rad/s²). It proves rPC is vastly superior for angled impacts."

---

## 📊 Category 3: Signal Processing & Data Validation

**Q7: Why was the SAE J211 filter necessary? Couldn't you just read the peak force from ANSYS?**
**Your Answer:** "No, because explicit penalty contact formulations artificially reflect stress waves through rigid bodies. My raw ANSYS data showed violent, high-frequency spikes up to 10 kN, which would incorrectly mean all helmets failed the EN 397 standard. The SAE J211 CFC 60 Butterworth low-pass filter (100 Hz cutoff) is the industry standard for crash tests. It strips out the non-physical numerical noise to reveal the true macroscopic structural deceleration."

**Q8: You noted a limitation regarding a 1000 Hz sampling rate. Why is this a limitation if it satisfies the Nyquist limit?**
**Your Answer:** "A 1000 Hz output frequency gives me one data point per millisecond. For an 8-10 ms impact, that's only about 10 data points total. While it technically satisfies the Nyquist-Shannon limit for my 100 Hz CFC 60 filter, 10 data points is sparse for explicit crash dynamics and risks missing highly transient peak forces before the filter is even applied. Standard crash tests often sample at 10,000 Hz. However, because my filtered Virgin HDPE result (4.05 kN) aligned perfectly with real-world experimental benchmarks (3.0-4.5 kN), I am confident the macroscopic response was captured accurately."

---

## 🌍 Category 4: Sustainability & Wider Impact

**Q9: Does Recycled PC actually offer a sustainability benefit if it requires specialized processing?**
**Your Answer:** "Yes, significantly. Based on my indicative Lifecycle Assessment (LCA) data, Recycled PC reduces greenhouse gas emissions by 80% and fossil energy consumption by 75% compared to virgin ABS. When you combine that massive environmental saving with the fact that it transmits a safe 4.54 kN of force *and* reduces rotational brain injury risk by 74%, it proves that sustainable PPE doesn't require a compromise on safety."

**Q10: What is the most significant limitation of your model, and how would you fix it if you had another 6 months?**
**Your Answer:** "The most significant limitation is modeling the EPS foam liner as linear elastic. Real EPS foam undergoes progressive cell crushing and densification, providing a flat energy absorption plateau. A linear elastic model transmits load much more rapidly, likely overestimating my peak transmitted forces by 10-15%. If I had more time, I would implement an extensive foam plasticity material model (like MAT_057 in LS-DYNA) and perform physical in-house drop tests to validate it."

---

## ⚙️ Category 5: Model Validation & Thermodynamics

**Q11: You stated your model achieved "0.00 J hourglass energy." What exactly is hourglassing, and why is this metric so important for explicit dynamics?**
**Your Answer:** "Hourglassing is a non-physical, zero-energy deformation mode that occurs in under-integrated elements, like the Belytschko-Tsay shell elements I used. The elements distort into a zigzag or 'hourglass' shape without generating any strain energy, which corrupts the stiffness matrix. Achieving exactly 0.00 J hourglass energy proves that the viscous hourglass control (Type 4) I implemented successfully suppressed these modes. Combined with a maximum total energy drift of just -0.03%, it mathematically guarantees that the deformation I recorded was driven by real physics, not numerical instability."

**Q12: You simplified the standard EN 960 aluminium headform into a perfectly rigid 5.0 kg sphere. How does assuming a rigid body affect the accuracy of your peak force results?**
**Your Answer:** "It makes the results slightly conservative, overestimating the transmitted force by an estimated 2 to 5%. In physical reality, an aluminium headform has elastic compliance—it absorbs a tiny fraction of the 49 Joules of impact energy. By making it perfectly rigid, 100% of the energy must be managed by the helmet shell and liner. I accepted this minor overestimation because a rigid sphere vastly simplifies the contact algorithms and ensures computational stability, while still maintaining the exact 5.0 kg mass parity required by the EN 397 standard."

**Q13: Let's talk about contact mechanics. You used the LS-DYNA *Automatic Surface-to-Surface* penalty algorithm with a penalty stiffness factor of 0.1. Why?**
**Your Answer:** "Penalty contact works by placing artificial 'springs' between penetrating nodes and surfaces to push them apart. If the stiffness is too high, the explicit time-step drops and the model becomes unstable, generating violent stress waves. If it's too low, nodes pass through each other non-physically. A factor of 0.1 is the industry standard for crashworthiness involving polymers and foams because it strikes the perfect balance: it prevents nodal penetration while keeping the contact interface soft enough to avoid artificial high-frequency numerical noise."

---

## 📈 Category 6: Deep-Dive into the Results

**Q14: In Phase 3, Virgin HDPE absorbed 27.35 Joules of internal energy, while Recycled PC only absorbed 16.67 Joules. If rPC absorbed 40% less energy, how did it still pass the 5.0 kN force transmission limit?**
**Your Answer:** "This highlights the two different protection strategies. Virgin HDPE is highly ductile; it protects the wearer by yielding and absorbing energy directly into its own structure (strain energy). Recycled PC is extremely stiff (yield of 6.12 kg/mm²). It doesn't absorb the energy itself; instead, it uses the 'Snowshoe Effect' to act as an elastic load distributor, spreading the impact across a huge surface area of the EPS foam liner. The liner does the absorbing. However, the trade-off for rPC is a massive 54.2% elastic rebound, leaving 26.90 J of residual kinetic energy."

**Q15: Why did you choose a 30% weight fraction for the Bamboo-HDPE composite? Why not 10% or 50%?**
**Your Answer:** "According to literature, notably Chen et al., a 10% fiber loading yields optimal tensile strength due to perfect matrix wet-out. However, to maximize the *sustainability* aspect—displacing as much petroleum plastic as possible—I pushed the fraction to 30%. At 30%, the material is highly stiff but borders on becoming brittle due to poor interfacial bonding. Testing it at this upper limit allowed me to see if it was still structurally viable for safety gear. It passed the EN 397 force test (4.51 kN), but failed catastrophically in the rotational kinematics (12,044 rad/s²), proving 30% is likely too high for angled impacts."

---

## 🏛️ Category 7: Critical Evaluation of the Industry & Standards

**Q16: Based on your Phase 5 oblique impact findings, do you believe the current EN 397 standard is sufficient for protecting construction workers?**
**Your Answer:** "No, I do not. EN 397 only tests a perfectly vertical drop onto the crown, measuring linear force. It is essentially testing for skull fractures. But in reality, falling objects strike at angles, causing the helmet to twist. My simulation showed that while Bamboo-HDPE easily passes the EN 397 linear force test, it generates a massive 12,044 rad/s² of angular acceleration in a 30-degree oblique impact—a level highly likely to cause Diffuse Axonal Injury (DAI) or a severe concussion. The standard urgently needs to incorporate a rotational or oblique impact requirement, similar to what we are seeing in bicycle helmet standards with MIPS technology."

**Q17: In your Project Management chapter, you mention 'IP Considerations' regarding your 30-degree oblique impact methodology. Why is a simulation methodology commercially relevant?**
**Your Answer:** "Because physical rotational drop-testing rigs are incredibly expensive to build and operate. By establishing a thermodynamically stable, Galilean-invariant FEA methodology to isolate and quantify 'Rigid Skidding' versus 'Ductile Smearing', I have created a virtual testing environment. Helmet manufacturers could use this exact methodology to rapidly prototype and optimize outer shell friction and flexural modulus to minimize DAI risk before ever pouring a physical mold. That workflow is highly valuable IP."

---

## 🛑 Category 8: Troubleshooting & The "Real Engineer" Test

**Q18: What was the single hardest technical challenge you faced during this dissertation, and how did you overcome it?**
**Your Answer:** "Dealing with the high-frequency numerical noise from the explicit penalty contact. When I ran my first Phase 2 drop tests, the raw nodal acceleration data showed peaks of 8 to 10 kN. Initially, I thought all the materials were failing the EN 397 standard. It took deep research into crashworthiness literature to realize these were non-physical stress wave reflections bouncing inside the rigid headform. I had to learn how to write a Python script to apply a bidirectional SAE J211 CFC 60 Butterworth filter. Seeing the noise strip away to reveal the true, smooth 4.05 kN macroscopic deceleration curve for HDPE was the biggest breakthrough of the project."
