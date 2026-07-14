#!/bin/bash

#SBATCH --partition=intel-128               # Partition
#SBATCH --cpus-per-task=8                   # Required CPUs
#SBATCH --hint=compute_bound                # Use one processor per core
#SBATCH --mail-type=ALL                     # Sent emails
#SBATCH --mail-user=malheirorhamon@gmail.com         # Used email
#SBATCH --time=0-1:0                        # Standard Pattern: Days-Hours:Minutes


# Parallelization (OpenMP) parameters ~
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PROC_BIND=true

# Allows Conda environment ~ 
eval "$(conda shell.bash hook)"

# Activates Conda environment ~
conda activate /home/sbbe26/conda/ipyrad

# Runs Ipyrad ~
ipyrad -p params-tutorial.txt -c 8 -s 4567
