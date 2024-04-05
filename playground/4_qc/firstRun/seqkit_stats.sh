#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

{ /usr/bin/time -v seqkit stats ../3_adapter_removal/soft_filter/all.trimmed.highquality.noadapter.fastq >> seqkit_stats.txt ; } 2>> seqkit_stats.sh.o 
