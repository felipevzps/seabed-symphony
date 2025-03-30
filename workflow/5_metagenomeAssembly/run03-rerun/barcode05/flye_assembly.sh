#!/bin/bash

#BSUB -q hpc
#BSUB -J flye_assembly
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 30:00
#BSUB -o flye_assembly.sh.o%J
#BSUB -e flye_assembly.sh.e%J

source activate metagenomics

input="/work3/fevape/rerun-analysis/3_adapterRemoval/run03/barcode05/soft_filter/barcode05.trimmed.highquality.noadapter.fastq/BC05.fastq"

/usr/bin/time -v flye --meta --nano-hq $input --out-dir assembly --iterations 2 --threads 10 
