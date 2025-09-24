#!/bin/bash -l

module load conda
source activate diploshic

diploSHIC makeTrainingSets ~/diploSHIC/discoal_CAVE/Neut.msOut.gz.diploid.fvec ~/diploSHIC/discoal_CAVE/Soft ~/diploSHIC/discoal_CAVE/Hard 5 0,1,2,3,4,6,7,8,9,10 ~/diploSHIC/trainingsets_CAVE
