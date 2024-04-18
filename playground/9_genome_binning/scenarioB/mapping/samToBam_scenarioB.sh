#!/bin/bash

#BSUB -q hpc
#BSUB -J samToBam
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o samToBam_scenarioB.sh.o%J
#BSUB -e samToBam_scenarioB.sh.e%J

source activate metagenomics

/usr/bin/time -v samtools view -b -o mapped_scenarioB.bam mapped_scenarioB.sam
/usr/bin/time -v samtools sort -o mapped_sorted_scenarioB.bam mapped_scenarioB.bam
/usr/bin/time -v samtools index mapped_sorted_scenarioB.bam
