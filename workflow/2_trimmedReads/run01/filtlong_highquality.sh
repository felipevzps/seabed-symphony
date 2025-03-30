#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

{ /usr/bin/time -v filtlong --keep_percent 90 soft_filter/all.trimmed.fastq >> soft_filter/all.trimmed.highquality.fastq ; } 2>> filtlong_highquality.sh.o

rm soft_filter/all.trimmed.fastq

