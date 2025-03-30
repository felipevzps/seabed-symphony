#!/bin/bash

#BSUB -q hpc
#BSUB -J filtlong_scenarioB
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=5GB]"
#BSUB -W 50
#BSUB -o filtlong_scenarioB.sh.o%J
#BSUB -e filtlong_scenarioB.sh.e%J

source activate metagenomics

mkdir soft_filter

/usr/bin/time -v filtlong --min_length 1000 soft_filter/rescued_subsampled_all_fastq_pseudomonas.fastq >> soft_filter/rescued_subsampled_all_fastq_pseudomonas.trimmed.fastq

rm rescued_subsampled_all_fastq_pseudomonas.fastq
