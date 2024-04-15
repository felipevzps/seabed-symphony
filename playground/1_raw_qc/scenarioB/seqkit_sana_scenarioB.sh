#!/bin/bash

#BSUB -q hpc
#BSUB -J seqkit_sana_scenarioB
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=5GB]"
#BSUB -W 50
#BSUB -o seqkit_sana_scenarioB.sh.o%J
#BSUB -e seqkit_sana_scenarioB.sh.e%J

source activate metagenomics

seqkit sana soft_filter/all_fastq_pseudomonas.trimmed.fastq --threads 5 -o soft_filter/rescued_all_fastq_pseudomonas.trimmed.fastq

rm -f soft_filter/all_fastq_pseudomonas.trimmed.fastq
