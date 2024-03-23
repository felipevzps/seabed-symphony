#!/bin/bash

#BSUB -q hpc
#BSUB -J filtlong_secondRun_highquality
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=5GB]"
#BSUB -W 50
#BSUB -o filtlong_secondRun_highquality.sh.o%J
#BSUB -e filtlong_secondRun_highquality.sh.e%J

source activate metagenomics

/usr/bin/time -v filtlong --keep_percent 90 soft_filter/second_run.trimmed.fastq >> soft_filter/second_run.trimmed.highquality.fastq 

rm -f soft_filter/second_run.trimmed.fastq
