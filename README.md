## Dummy Repository for the [SBBE26 Introduction to Genomic Analyses Workshop](https://sbbe-oficial.github.io/workshopgenomics/)

> Documentation outlining the pipeline's workflow.  
***

### Data Processing 

The dataset [ipsimdata.tar.gz](https://github.com/malheirorhamon/WorkshopSBBE26/blob/main/ipsimdata.tar.gz) was processed with [Ipyrad](https://ipyrad.readthedocs.io/en/master/) using the parameters in [params-tutorial.txt](https://github.com/USUÁRIO-GITHUB/WorkshopSBBE26/blob/main/params-tutorial.txt).

### Population Structure  

#### Principal Component Analysis

This analysis was performed with the software [Plink](https://www.cog-genomics.org/plink/) as described in [RunsPCA.sh](https://github.com/USUÁRIO-GITHUB/WorkshopSBBE26/blob/main/SBBE26_PopGen/PCA/RunsPCA.sh). The results were ploted using R script [PlotsPCA.R](https://github.com/USUÁRIO-GITHUB/WorkshopSBBE26/blob/main/SBBE26_PopGen/PCA/PlotsPCA.R).

- [PCA_Plot.pdf](https://github.com/malheirorhamon/WorkshopSBBE26/blob/main/SBBE26_PopGen/PCA/PCA_Plot.pdf)

#### Estimation of Individual Ancestries

This analysis was performed with the software [Admixture](https://dalexander.github.io/admixture/) as described in [RunsAdmixture.sh](https://github.com/USUÁRIO-GITHUB/WorkshopSBBE26/blob/main/SBBE26_PopGen/Admixture/RunsAdmixture.sh). The results were ploted using R script [PlotsAdmixture.R](https://github.com/USUÁRIO-GITHUB/WorkshopSBBE26/blob/main/SBBE26_PopGen/Admixture/PlotsAdmixture.R).

- [Admixture_Plot.pdf](https://github.com/malheirorhamon/WorkshopSBBE26/blob/main/SBBE26_PopGen/Admixture/Admixture_Plot.pdf)
