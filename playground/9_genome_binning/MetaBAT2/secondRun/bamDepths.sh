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

bam=`ls -1 ../../mapping/secondRun/mapped_sorted_secondRun.bam`

/usr/bin/time -v jgi_summarize_bam_contig_depths --outputDepth depth.txt $bam
