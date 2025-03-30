#!/bin/bash

#BSUB -q hpc
#BSUB -J porechop_secondRun
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=16GB]"
#BSUB -W 3:00
#BSUB -o porechop_secondRun.sh.o%J
#BSUB -e porechop_secondRun.sh.e%J

source activate metagenomics

mkdir soft_filter

/usr/bin/time -v porechop -i ../2_trimmed/soft_filter/second_run.trimmed.highquality.fastq -o soft_filter/second_run.trimmed.highquality.noadapter.fastq --threads 5 
