#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

# Playing with polishing iterations
#{ /usr/bin/time -v flye --meta --nano-hq ../3_adapter_removal/soft_filter/all.trimmed.highquality.noadapter.fastq --out-dir 1_polishing --threads 10 ; } 2>> flye_assembly.sh.o1
#{ /usr/bin/time -v flye --meta --nano-hq ../3_adapter_removal/soft_filter/all.trimmed.highquality.noadapter.fastq --out-dir 2_polishing --iterations 2 --threads 10 ; } 2>> flye_assembly.sh.o2

# combined assembly
{ /usr/bin/time -v flye --meta --nano-hq ../3_adapter_removal/soft_filter/combined.trimmed.highquality.noadapter.fastq --out-dir 1_polishing_combined --iterations 1 --threads 10 ; } 2>> flye_assembly_combined.sh.o
