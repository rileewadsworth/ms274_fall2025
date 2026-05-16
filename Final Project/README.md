# Project: Reduced Wind Impacts on Elkhorn Slough Surface Temperature and Dissolved Oxygen

## Project Overview
Elkhorn Slough is an estuary in central California that connects to the Monterey Bay. It is heavily influenced by tidal dynamics, eutrophification from nearby agriculutral practices, and runoff from nearby farms and industries. Many important species utilize this estuary as a nursery, so it is highly important to know how environmental changes will impact water quality and conditions to understand how these organisms will be impacted. By modeling these environmental changes using MITgcm, we can better understand how conditions in Elkhorn Slough will change. 

## Science Question
*How will reduced wind speed impact surface temperature and dissolved oxygen levels in Elkhorn Slough*

## Experimental Design
First, I began by running a 'control' run utilizing normal wind forcing in order to generate a 7-day simulation of surface temperature, salinity, and dissolved oxygen in Elkhorn Slough. Then, I ran a reduced-wind run by reducing wind forcing by 50% and running the simulation again. In both runs, OBCS was off, as there are several complex land pockets within Elkhorn Slough which was causing the model to become unstable. Dissolved oxygen was included as a passive tracer. The model was built and run using MITgcm on the Spartan HPC cluster using MPI. The model used 16 CPUs. 

## Repository Structure 
In this repository, I have included my model configuration files, jupyter notebooks used for initalization files, and final analysis notebooks. The model configuation files include 
code/ 

input/
  slough_bathymetry.bin
  THETA_IC.bin
  SALT_IC.bin
  DO_IC.bin
  obcs/obcs files
  exf/exf files

namelist/
  data
  data.pkg
  data.diagnostics
  
*Note: For the input folder, the exf files were too large to upload to GitHub. 

## Reproducibility
To reproduce this project, follow the steps below.
1. Run model grid notebook
2. Run bathymetry notebook
3. Run Intial conditions notebook
4. Run external forcing notebook
5. Run boundary conditions notebook
6. Import model configuration files to Spartan
7. Build MITgcm on Spartan
8. Run control simulation using normal wind forcing
9. Reduce wind forcing by 50%, and run reduced wind simulation
10. Export output files from both runs
11. Run analysis notebook

## Limiations
Due to the complex topography of Elkhorn Slough, I was unable to utilize OBCS. It was tested, but ultimately disabled as runs became unstable. This limited tidal dynamics with Monterey Bay, which definitely has an impact on surface temperature, salinity, and dissolved oxygen. Additionally, I included DO as a passive tracer, which does not include any biological calculations. This severely limited any changes I saw in DO in my simulations. Lastly, I ran a 7-day simulation, which shows some changes. However, environmental conditions change in Elkhorn Slough seasonally, so a longer run would be interesting and perhaps more scientifically sound in order to fully realize any seasonal fluctations that might occur. 

