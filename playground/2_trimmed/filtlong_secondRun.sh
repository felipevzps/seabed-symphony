#!/bin/bash

#BSUB -q hpc
#BSUB -J filtlong_secondRun
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=5GB]"
#BSUB -W 50
#BSUB -o filtlong_secondRun.sh.o%J
#BSUB -e filtlong_secondRun.sh.e%J

source activate metagenomics

mkdir soft_filter

/usr/bin/time -v filtlong --min_length 1000 ../0_raw/second_run.fastq >> soft_filter/second_run.trimmed.fastq
