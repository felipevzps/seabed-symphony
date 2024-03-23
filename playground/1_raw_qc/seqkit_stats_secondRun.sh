#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

{ /usr/bin/time -v seqkit stats ../0_raw/all.fastq >> seqkit_stats.txt ; } 2>> seqkit_stats.sh.o 
