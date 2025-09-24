#!/bin/bash
CHROM=$1


module load conda
source activate diploshic

diploSHIC predict SurfaceModel.json SurfaceModel.weights.hdf5 ~/diploSHIC/featurevectors_SURFACE/5kb_windows/CHOY_${CHROM}_diploid.fvec ~/diploSHIC/predictions_SURFACE/5kb_windows/CHOY_${CHROM}.preds

diploSHIC predict SurfaceModel.json SurfaceModel.weights.hdf5 ~/diploSHIC/featurevectors_SURFACE/5kb_windows/RASCON_${CHROM}_diploid.fvec ~/diploSHIC/predictions_SURFACE/5kb_windows/RASCON_${CHROM}.preds
