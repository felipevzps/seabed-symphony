#!/bin/bash

#BSUB -q hpc
#BSUB -J filtlong
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=5GB]"
#BSUB -W 2:00
#BSUB -o filtlong.sh.o%J
#BSUB -e filtlong.sh.e%J

source activate metagenomics

mkdir soft_filter

/usr/bin/time -v filtlong --min_length 1000 ../../../0_raw/third_run/barcode02/barcode02.fastq >> soft_filter/barcode02.trimmed.fastq