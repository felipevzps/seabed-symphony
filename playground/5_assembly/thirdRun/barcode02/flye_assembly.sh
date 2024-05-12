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

/usr/bin/time -v flye --meta --nano-hq ../../../3_adapter_removal/third_run/barcode02/soft_filter/barcode02.trimmed.highquality.noadapter.fastq/BC02.fastq --out-dir barcode02 --iterations 2 --threads 10 
