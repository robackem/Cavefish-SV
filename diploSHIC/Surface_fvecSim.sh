#!/bin/bash
SIM=$1
REF=$2

module load conda
source activate diploshic

diploSHIC fvecSim diploid ${SIM}.msOut.gz ${SIM}.msOut.gz.diploid.fvec --totalPhysLen 55000 --maskFileName $REF --chrArmsForMasking all
