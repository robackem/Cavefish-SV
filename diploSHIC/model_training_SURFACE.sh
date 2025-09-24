#!/bin/bash -l


module load conda
source activate diploshic


diploSHIC train trainingsets_SURFACE/ trainingsets_SURFACE/ SurfaceModel
