#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

{ /usr/bin/time -v seqkit stats ../0_raw/P5_1 >> seqkit_pureCulture_stats.txt ; } 2>> seqkit_stats.sh.o2 
