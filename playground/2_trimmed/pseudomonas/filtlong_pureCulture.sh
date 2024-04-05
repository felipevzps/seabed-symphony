#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

mkdir soft_filter

{ /usr/bin/time -v filtlong --min_length 1000 ../0_raw/P5_1 >> soft_filter/P5_1.trimmed.fastq ; } 2>> filtlong.sh.o
