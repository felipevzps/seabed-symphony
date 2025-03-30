#!/bin/bash

#BSUB -q hpc
#BSUB -J flye_assembly_scenarioB
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 30:00
#BSUB -o flye_assembly_scenarioB.sh.o%J
#BSUB -e flye_assembly_scenarioB.sh.e%J

source activate metagenomics

/usr/bin/time -v flye --meta --nano-hq ../../3_adapter_removal/scenarioB/soft_filter/rescued_subsampled_all_fastq_pseudomonas.trimmed.highquality.noadapter.fastq --out-dir scenarioB --iterations 1 --threads 10 
