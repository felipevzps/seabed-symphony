#!/bin/bash

#BSUB -q hpc
#BSUB -J filtlong_highquality
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=5GB]"
#BSUB -W 50
#BSUB -o filtlong_highquality.sh.o%J
#BSUB -e filtlong_highquality.sh.e%J

source activate metagenomics

/usr/bin/time -v filtlong --keep_percent 90 soft_filter/barcode01.trimmed.fastq >> soft_filter/barcode01.trimmed.highquality.fastq  

rm -f soft_filter/barcode01.trimmed.fastq
