#!/bin/bash


#SBATCH --partition=intel-128               # Partition
#SBATCH --cpus-per-task=4                   # Required CPUs
#SBATCH --hint=compute_bound                # Use one processor per core
#SBATCH --mail-type=ALL                     # Sent emails
#SBATCH --mail-user=malheirorhamon@gmail.com         # Used email
#SBATCH --time=0-1:0                        # Standard Pattern: Days-Hours:Minutes


# Edits .BIM file ~
sed -i 's/^RAD_//' ../tutorial_pruned.bim

# Runs Admixture ~
for K in $(seq 1 4);
        do /home/sbbe26/admixture_linux-1.4.0/admixture --cv ../tutorial_pruned.bed $K -j4 | tee log_${K}.out;
done
