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

/usr/bin/time -v seqkit stats ../../../3_adapter_removal/third_run/barcode01/soft_filter/barcode01.trimmed.highquality.noadapter.fastq/BC01.fastq >> seqkit_stats.txt