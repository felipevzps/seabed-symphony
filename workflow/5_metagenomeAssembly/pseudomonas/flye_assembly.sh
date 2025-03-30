#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

# Playing with polishing iterations
{ /usr/bin/time -v flye --nano-hq ../../3_adapter_removal/soft_filter/P5_1.trimmed.highquality.noadapter.fastq --out-dir 2_polishing --iterations 1 --threads 10 ; } 2>> flye_assembly.sh.o
