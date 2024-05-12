#!/bin/bash

#BSUB -q hpc
#BSUB -J seqkit_stats
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o seqkit_stats.sh.o%J
#BSUB -e seqkit_stats.sh.e%J

source activate metagenomics

/usr/bin/time -v seqkit stats ../../../0_raw/third_run/barcode05/barcode05.fastq >> seqkit_stats.txt
