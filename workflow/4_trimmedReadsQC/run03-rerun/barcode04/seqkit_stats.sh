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

input="/work3/fevape/rerun-analysis/3_adapterRemoval/run03/barcode04/soft_filter/barcode04.trimmed.highquality.noadapter.fastq/BC04.fastq"

/usr/bin/time -v seqkit stats $input  >> seqkit_stats.txt
