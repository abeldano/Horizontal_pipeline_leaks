# CFD-DEM Simulation Case

## 📌 Overview
This repository contains a CFD-DEM simulation case developed using CFDEM coupling (OpenFOAM + LIGGGHTS). 
The objective of this case is to analyze the failure mechanism of horizontal directed water pipeline leaks.

---

## 🎯 Objectives
- Simulate particle-fluid interaction under controlled conditions.
- Analyze particle velocity and flow patterns.
- Evaluate the effect of inlet flow velocity, orifice size, particle diameter, and leak depth.  
- Compare numerical results with experimental observations.

---

## 🧱 Case Description

### Fluid Phase (CFD)
- Solver: `cfdemSolverPiso`
- Flow regime: turbulent
- Fluid properties:
  - Density: 1000 $kg/m^3$  
  - Kinematic viscosity: $10^{-6}$ $m^2/s$  

### Particle Phase (DEM)
- Number of particles: 122048
- Particle diameter: 0.0026 m  
- Density: 2500 $kg/m^3$  
- Contact model: Hertz-Mindlin (no slip / with friction)  
- Coefficient of restitution: 0.9  
- Coefficient of friction: 0.1
- Rolling Friction: 0.05  
- Poisson’s ratio: 0.45
- Packing Fraction: 0.62  

---

## ⚙️ Numerical Parameters

### Discretization
- Cell size (Δx): 0.003 m

### Time-stepping
- CFD time step (Δt_f): $5\cdot 10^{-5}$ s  
- DEM time step (Δt_p): $1\cdot 10^{-4}$ s  
- Coupling interval: 50  

### Stability Criteria
- Courant number: < 0.47  
- DEM time step: Δt_p ≤ $t_{Rayleigh}$ 
  - where $t_{Rayleigh}=\frac{\pi R}{0.8766 + 0.163\nu_p}\sqrt{\frac{\rho_p}{G}}=1.64\cdot10^{-4}$ s

---

## ▶️ How to Run

1. Open terminal in case folder

2. Run:
```bash
source allrun.sh
```
## 📊 Post-processing
 - Tool: ParaView
 - Key variables:
    - Particle velocity
    - Void fraction
    - Fluid velocity and pressure field

Example:
```bash
cd CFD
paraFoam
```

## 📈 Data Analysis

Particle velocities were extracted from selected regions and analyzed over time. Mean values and standard deviations were computed to characterize temporal fluctuations.

## ⚠️ Uncertainty and Limitations
Numerical results are subject to:
- Mesh resolution effects
- Time step selection
- Drag model assumptions
- Particle velocity exhibits temporal fluctuations due to the dynamic nature of the system
- Experimental comparisons include measurement uncertainties

## 📁 Repository Structure
```
├── CFD/
│   ├── 0/
│   ├── constant/
│   └── system/
├── DEM/
│   ├── in.nearLeak_init
│   ├── in.nearLeak_run
│   └── STL/
├── Allrun.sh
├── parCFDDEMrub.sh
├── parDEMrun.sh
└── README.md
```
## 📚 References
- CFDEM Project: https://www.cfdem.com
- OpenFOAM documentation
- LIGGGHTS documentation

## 👤 Author
- Name: Sebastián Avendaño
- Affiliation: University of Chile, Department of Civil Engineering
