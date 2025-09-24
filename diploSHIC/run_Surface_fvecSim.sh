#!/bin/bash


SIMS=(Neut Hard_0 Hard_1 Hard_2 Hard_3 Hard_4 Hard_5 Hard_6 Hard_7 Hard_8 Hard_9 Hard_10 Soft_0 Soft_1 Soft_2 Soft_3 Soft_4 Soft_5 Soft_6 Soft_7 Soft_8 Soft_9 Soft_10)
REF=GCF_023375975.1_AstMex3_surface_genomic.fna


for SIM in ${SIMS[@]}; do sbatch --nodes=1 --ntasks=20  --mem=50gb -t 96:00:00 --mail-user=robac028@umn.edu --mail-type=FAIL \
--wrap "./Surface_fvecSim.sh $SIM $REF"; done

