#!/bin/bash

. ~/.bashrc

source $CFDEM_SRC_DIR/lagrangian/cfdemParticle/etc/functions.sh

#--------------------------------------------------------------------------------#
casePath="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"
logpath="$casePath"
headerText="run_liggghts_init_DEM"
logfileName="log_$headerText"
solverName="in.nearLeak_init"
nrProcs="8"
machineFileName="none"
#--------------------------------------------------------------------------------#

parDEMrun $logpath $logfileName $casePath $headerText $solverName $nrProcs $machineFileName

