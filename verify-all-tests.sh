#!/bin/bash

boost_types=( "lower-total" "upper-total" "lower-dihedral" "upper-dihedral" "lower-dual" "upper-dual")

if ! command -v PyReweighting-1D.py &> /dev/null
then
    echo "You need to add the PyReweighting programs to your path prior to running this script."
    exit
fi

if [ "$#" -ne 2 ]; then
    echo "Usage verify-all-tests.sh location-of-cmd-directory output-directory"
    exit 2
fi


cMD_Directory=`realpath $1`

OUTPUT_BASE=$2

mkdir $OUTPUT_BASE


for boost_type in "${boost_types[@]}"
do
    ./do-average-test.sh $cMD_Directory $boost_type $OUTPUT_BASE/test-$boost_type/
done

echo "All Simulations complete."