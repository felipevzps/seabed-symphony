#!/bin/bash

#BSUB -q hpc
#BSUB -J samToBam
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 50
#BSUB -o samToBam.sh.o%J
#BSUB -e samToBam.sh.e%J

source activate metagenomics

/usr/bin/time -v samtools view -b -o mapped.bam mapped.sam
/usr/bin/time -v samtools sort -o mapped_sorted.bam mapped.bam
/usr/bin/time -v samtools index mapped_sorted.bam
