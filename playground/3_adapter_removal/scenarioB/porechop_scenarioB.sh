#!/bin/bash

#BSUB -q hpc
#BSUB -J porechop_scenarioB
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=16GB]"
#BSUB -W 10:00
#BSUB -o porechop_scenarioB.sh.o%J
#BSUB -e porechop_scenarioB.sh.e%J

source activate metagenomics

mkdir soft_filter

/usr/bin/time -v porechop -i ../../2_trimmed/scenarioB/soft_filter/rescued_subsampled_all_fastq_pseudomonas.trimmed.highquality.fastq -o soft_filter/rescued_subsampled_all_fastq_pseudomonas.trimmed.highquality.noadapter.fastq --threads 5 
