#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

{ /usr/bin/time -v seqkit stats ../3_adapter_removal/soft_filter/P5_1.trimmed.highquality.noadapter.fastq >> seqkit_pureCulture_stats.txt ; } 2>> seqkit_pureCulture_stats.sh.o 
