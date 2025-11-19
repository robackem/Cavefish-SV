#!/bin/bash -l

module load conda
source activate diploshic

diploSHIC fvecVcf diploid ~/diploSHIC/filtered_vcfs/MOLINO_SNPs_wINDELbuffer_checked_HARDfilter_PASS_noreps.vcf NC_064408.1 134019835 MOLINO_NC_064408.1_diploid.fvec --winSize 55000
