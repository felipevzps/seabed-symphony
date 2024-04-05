#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

mkdir soft_filter

{ /usr/bin/time -v porechop -i ../2_trimmed/soft_filter/all.trimmed.highquality.fastq -o soft_filter/all.trimmed.highquality.noadapter.fastq --threads 5 ; } 2>> porechop.sh.o

