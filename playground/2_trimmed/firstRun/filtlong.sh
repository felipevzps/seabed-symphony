#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

mkdir soft_filter

{ /usr/bin/time -v filtlong --min_length 1000 ../0_raw/all.fastq >> soft_filter/all.trimmed.fastq ; } 2>> filtlong.sh.o
