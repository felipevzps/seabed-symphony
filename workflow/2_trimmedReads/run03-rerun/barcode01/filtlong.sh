#!/bin/bash

#BSUB -q hpc
#BSUB -J filtlong
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=5GB]"
#BSUB -W 50
#BSUB -o filtlong.sh.o%J
#BSUB -e filtlong.sh.e%J

source activate metagenomics

mkdir soft_filter

input="/work3/fevape/rerun-analysis/0_rawReads/run03/barcode01/barcode01.fastq"

/usr/bin/time -v filtlong --min_length 1000 $input  >> soft_filter/barcode01.trimmed.fastq
