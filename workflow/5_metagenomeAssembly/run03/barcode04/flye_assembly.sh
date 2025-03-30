#!/bin/bash

#BSUB -q hpc
#BSUB -J flye_assembly
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 48:00
#BSUB -o flye_assembly.sh.o%J
#BSUB -e flye_assembly.sh.e%J

source activate metagenomics

/usr/bin/time -v flye --meta --nano-hq ../../../3_adapter_removal/third_run/barcode04/soft_filter/barcode04.trimmed.highquality.noadapter.fastq/BC04.fastq --out-dir barcode04 --iterations 2 --threads 10 
