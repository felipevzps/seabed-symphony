#!/bin/bash

#BSUB -q hpc
#BSUB -J bamDepths
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o bamDepths.sh.o%J
#BSUB -e bamDepths.sh.e%J

source activate metagenomics

bam="/work3/fevape/rerun-analysis/9_genomeBinning/mapping/run03/barcode02/mapped_sorted.bam"

/usr/bin/time -v jgi_summarize_bam_contig_depths --outputDepth depth.txt $bam
