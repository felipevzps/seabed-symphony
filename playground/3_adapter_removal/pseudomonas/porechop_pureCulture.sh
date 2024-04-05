#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

mkdir soft_filter

{ /usr/bin/time -v porechop -i ../2_trimmed/soft_filter/P5_1.trimmed.highquality.fastq -o soft_filter/P5_1.trimmed.highquality.noadapter.fastq --threads 5 ; } 2>> porechop_pureCulture.sh.o

