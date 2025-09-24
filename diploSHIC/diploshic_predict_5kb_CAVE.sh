#!/bin/bash
CHROM=$1


module load conda
source activate diploshic


diploSHIC predict CaveModel.json CaveModel.weights.hdf5 ~/diploSHIC/featurevectors_CAVE/5kb_windows/MOLINO_${CHROM}_diploid.fvec ~/diploSHIC/predictions_CAVE/5kb_windows/MOLINO_${CHROM}.preds

diploSHIC predict CaveModel.json CaveModel.weights.hdf5 ~/diploSHIC/featurevectors_CAVE/5kb_windows/TINAJA_${CHROM}_diploid.fvec ~/diploSHIC/predictions_CAVE/5kb_windows/TINAJA_${CHROM}.preds

diploSHIC predict CaveModel.json CaveModel.weights.hdf5 ~/diploSHIC/featurevectors_CAVE/5kb_windows/PACHON_${CHROM}_diploid.fvec ~/diploSHIC/predictions_CAVE/5kb_windows/PACHON_${CHROM}.preds



