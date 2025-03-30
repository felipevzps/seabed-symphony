#!/bin/bash

#BSUB -q hpc
#BSUB -J extractBGCs
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o extractBGCs.sh.o%J
#BSUB -e extractBGCs.sh.e%J

source activate metagenomics

# find most recent run_data.js inside BiG-SCAPE output
run_data=$(find output/html_content/networks/ -type f -path "*/run_data.js" | sort | tail -n 1)

if [[ -z "$run_data" ]]; then
	echo "ERROR: run_data.js not found."
	exit 1
fi

output="bgc_count.tsv"

/usr/bin/time -v /work3/fevape/rerun-analysis/bin/./extractBGCs.py --i $run_data --o $output
