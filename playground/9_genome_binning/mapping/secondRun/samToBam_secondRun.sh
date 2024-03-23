#!/bin/bash

#BSUB -q hpc
#BSUB -J samToBam_secondRun
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o samToBam_secondRun.sh.o%J
#BSUB -e samToBam_secondRun.sh.e%J

source activate metagenomics

/usr/bin/time -v samtools view -b -o mapped_secondRun.bam mapped_secondRun.sam
/usr/bin/time -v samtools sort -o mapped_sorted_secondRun.bam mapped_secondRun.bam
/usr/bin/time -v samtools index mapped_sorted_secondRun.bam
