#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

/usr/bin/time -v filtlong --min_length 1000 ../0_raw/all.500k.fastq > soft_filter/all.500k.trimmed.fastq
