#!/bin/bash

#BSUB -q hpc
#BSUB -J seqkit_scenarioB_stats
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o seqkit_scenarioB_stats.sh.o%J
#BSUB -e seqkit_scenarioB_stats.sh.e%J

source activate metagenomics

/usr/bin/time -v seqkit stats ../../3_adapter_removal/scenarioB/soft_filter/rescued_subsampled_all_fastq_pseudomonas.trimmed.highquality.noadapter.fastq >> seqkit_scenarioB_stats.txt
