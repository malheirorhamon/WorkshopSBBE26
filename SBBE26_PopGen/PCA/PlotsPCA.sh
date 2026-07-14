#!/bin/bash


#SBATCH --partition=intel-128               # Partition
#SBATCH --cpus-per-task=2                   # Required CPUs
#SBATCH --hint=compute_bound                # Use one processor per core
#SBATCH --mail-type=ALL                     # Sent emails
#SBATCH --mail-user=malheirorhamon@gmail.com         # Used email
#SBATCH --time=0-1:0                        # Standard Pattern: Days-Hours:Minutes


# Allows Conda enviroments ~
eval "$(conda shell.bash hook)"

# Starts Conda environment ~
conda activate /home/sbbe26/conda/

# Creates PCA Plot ~
Rscript --vanilla --slave ./PlotsPCA.R
