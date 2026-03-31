#!/bin/bash

casePath="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"

echo "Deleting previous run..."
cd $casePath/CFD
rm -r 0.* [1-9]*
foamListTimes -processor -rm
cd ..

if [ -f "$casePath/CFD/constant/polyMesh/points" ]; then
    echo "mesh was built before - using old mesh"
else
    echo "mesh needs to be built"
    cd $casePath/CFD
    blockMesh
fi

if [ -f "$casePath/DEM/post/restart/liggghts.restart" ];  then
    echo "LIGGGHTS init was run before - using existing restart file"
else
    . $casePath/parDEMrun.sh
fi

echo "Initial particles generated"

. $casePath/parCFDDEMrun.sh
echo "Reconstructing Case"
reconstructPar -noLagrangian
echo "Simulation finished ... opening Paraview"
cd $casePath/CFD
paraFoam -builtin

