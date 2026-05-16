#!/bin/bash
#SBATCH --partition=nodes
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --time=01:00:00
#SBATCH --job-name=elk_test
#SBATCH --output=elk_test_%j.out
#SBATCH --error=elk_test_%j.err

export MPI_HOME=/scratch/home/rwadsworth/.conda/envs/ms274

mpirun -np 16 ./mitgcmuv
