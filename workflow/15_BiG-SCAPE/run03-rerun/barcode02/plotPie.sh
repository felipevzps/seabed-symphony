#!/bin/bash

#BSUB -q hpc
#BSUB -J plotPie
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o plotPie.sh.o%J
#BSUB -e plotPie.sh.e%J

source activate metagenomics

# find most recent run_data.js inside BiG-SCAPE output
run_data=$(find output/html_content/networks/ -type f -path "*/run_data.js" | sort | tail -n 1)

if [[ -z "$run_data" ]]; then
	echo "ERROR: run_data.js not found."
	exit 1
fi

/usr/bin/time -v /work3/fevape/rerun-analysis/bin/./plotPie.py --i $run_data
