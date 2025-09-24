#!/bin/bash -l

module load conda
source activate diploshic

diploSHIC makeTrainingSets ~/diploSHIC/discoal_SURFACE/Neut.msOut.gz.diploid.fvec ~/diploSHIC/discoal_SURFACE/Soft ~/diploSHIC/discoal_SURFACE/Hard 5 0,1,2,3,4,6,7,8,9,10 ~/diploSHIC/trainingsets_SURFACE
