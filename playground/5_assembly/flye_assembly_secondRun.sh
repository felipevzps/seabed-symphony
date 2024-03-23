#!/bin/bash

#BSUB -q hpc
#BSUB -J flye_assembly_secondRun
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 30:00
#BSUB -o flye_assembly_secondRun.sh.o%J
#BSUB -e flye_assembly_secondRun.sh.e%J

source activate metagenomics

/usr/bin/time -v flye --meta --nano-hq ../3_adapter_removal/soft_filter/second_run.trimmed.highquality.noadapter.fastq --out-dir secondRun --iterations 2 --threads 10 
