#!/bin/bash


#SBATCH --partition=intel-128               # Partition
#SBATCH --cpus-per-task=2                   # Required CPUs
#SBATCH --hint=compute_bound                # Use one processor per core
#SBATCH --mail-type=ALL                     # Sent emails
#SBATCH --mail-user=malheirorhamon@gmail.com        # Used email
#SBATCH --time=0-1:0                        # Standard Pattern: Days-Hours:Minutes


# Allows Conda enviroments ~
eval "$(conda shell.bash hook)"

# Starts Plink environment ~
conda activate /home/sbbe26/conda/plink

# Converts .VCF into .BED ~
plink --vcf ../tutorial_outfiles/tutorial.vcf --make-bed --out ./tutorial --double-id --allow-extra-chr

# Calculates LD ~
plink --bfile ./tutorial --maf 0.05 --geno 0.05 --indep-pairwise 50 5 0.2 --out ./tutorial_LD --allow-extra-chr

# Prunes for LD ~
plink --bfile ./tutorial --extract ./tutorial_LD.prune.in --make-bed --out ./tutorial_pruned --allow-extra-chr
