#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

/usr/bin/time -v filtlong --keep_percent 90 aggressive_filter/all.500k.trimmed.fastq > aggressive_filter/all.500k.trimmed.highquality.fastq

rm aggressive_filter/all.500k.trimmed.fastq
