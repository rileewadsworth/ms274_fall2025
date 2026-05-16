# Project: Reduced Wind Impacts on Elkhorn Slough Surface Temperature and Dissolved Oxygen

## Project Overview
Elkhorn Slough is an estuary in central California that connects to Monterey Bay. It is influenced by tidal exchange, eutrophication from nearby agricultural practices, and runoff from surrounding land use. Many important species use the estuary as nursery habitat, so understanding how environmental changes affect water quality is important for predicting potential impacts on these organisms. In this project, I used MITgcm to create a simplified model configuration of Elkhorn Slough and investigate how reduced wind forcing affects surface temperature, salinity, and dissolved oxygen.

## Science Question
*How will reduced wind speed impact surface temperature and dissolved oxygen levels in Elkhorn Slough*

## Experimental Design
I ran two 7-day simulations:
1. **Control run:** normal wind forcing.
2. **Reduced-wind run:** wind forcing reduced by 50%.

Both simulations used the same model grid, bathymetry, initial conditions, external forcing, timestep, and diagnostic output settings. The only difference between the two simulations was the wind forcing. Dissolved oxygen was included as a passive tracer using the MITgcm PTRACERS package. OBCS was tested but disabled in the final simulations. The Monterey Bay/Elkhorn Slough mouth geometry caused repeated OBCS mask errors, so the final experiments were run as a simplified closed-domain configuration with external atmospheric forcing. The model was built and run on the Spartan HPC cluster using MPI with 16 CPUs.

## Repository Structure 
This repository contains:

- `notebooks_initialization/`: Jupyter notebooks used to create the model grid, bathymetry, initial conditions, external forcing, and boundary condition files.
- `model_config/`: MITgcm code and namelist files used to build and run the model on Spartan.
- `analysis/`: Notebook used to compare the control and reduced-wind simulations.
- `figures/`: Final plots generated from the model output.
- `movies/`: Model visualization movies/GIFs.
- `input/`: Model input files generated from the notebooks. Some large EXF binary files are not uploaded to GitHub due to file size.

## Reproducibility
To reproduce this project, follow the steps below:
1. Run the model grid notebook.
2. Run the bathymetry notebook.
3. Run the initial conditions notebook.
4. Run the external forcing notebook.
5. Run the boundary conditions notebook.
6. Copy the generated model input files to Spartan.
6. Build MITgcm on Spartan using the files in model_config/code/.
7. Run the control simulation using normal wind forcing.
8. Create the reduced-wind forcing by multiplying UWIND, VWIND, and WDSPD by 0.5.
9. Run the reduced-wind simulation.
10. Export output files from both runs.
11. Run the analysis notebook to generate plots, time series, observation comparisons, and movies.

## Main Results
The reduced-wind simulation produced a clear warming response over the 7-day experiment. By day 7, the reduced-wind run was approximately 0.19°C warmer on average than the control run.

Mean salinity changed very little between experiments, with a reduced-minus-control difference of approximately -0.001 PSU. Passive-tracer dissolved oxygen also changed very little, with a reduced-minus-control difference of approximately +0.001 mg/L.

This suggests that reduced wind forcing affected surface temperature more strongly than salinity or passive-tracer DO over the short 7-day experiment.

## Limiations
OBCS was tested but disabled in the final simulations because the Monterey Bay/Elkhorn Slough mouth geometry caused repeated boundary-mask errors. This means that the final simulations do not include tidal exchange with Monterey Bay, which is an important physical process in the real system.

Dissolved oxygen was modeled as a passive tracer. This means the model captured transport and mixing of the initialized DO field, but it did not include biological oxygen consumption, photosynthesis, sediment oxygen demand, air-sea gas exchange, or temperature-dependent oxygen solubility. Because of this, the DO response in the simulations was small.

The final simulations were 7 days long. This was appropriate for a short wind-reduction comparison, but longer simulations would be needed to examine seasonal changes or longer-term water-quality impacts.

