#!/bin/bash

#BSUB -q hpc
#BSUB -J plotSankeyDiagram
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o plotSankeyDiagram.sh.o%J
#BSUB -e plotSankeyDiagram.sh.e%J

source activate metagenomics

gtdb_summary="output/gtdbtk.bac120.summary.tsv"

/usr/bin/time -v /work3/fevape/rerun-analysis/bin/./plotSankeyDiagram.py --i $gtdb_summary
