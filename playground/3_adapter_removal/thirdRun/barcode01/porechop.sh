#!/bin/bash

#BSUB -q hpc
#BSUB -J porechop
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=16GB]"
#BSUB -W 10:00
#BSUB -o porechop.sh.o%J
#BSUB -e porechop.sh.e%J

source activate metagenomics

mkdir soft_filter

/usr/bin/time -v porechop -i ../../../2_trimmed/third_run/barcode01/soft_filter/barcode01.trimmed.highquality.fastq -b soft_filter/barcode01.trimmed.highquality.noadapter.fastq --threads 5 
