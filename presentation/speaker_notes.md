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