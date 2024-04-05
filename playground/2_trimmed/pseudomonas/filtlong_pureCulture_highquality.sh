#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

{ /usr/bin/time -v filtlong --keep_percent 90 soft_filter/P5_1.trimmed.fastq >> soft_filter/P5_1.trimmed.highquality.fastq ; } 2>> filtlong_pureCulture_highquality.sh.o

rm soft_filter/P5_1.trimmed.fastq

