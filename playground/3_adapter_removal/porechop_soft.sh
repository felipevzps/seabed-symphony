#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

/usr/bin/time -v porechop -i ../2_trimmed/soft_filter/all.500k.trimmed.highquality.fastq -o soft_filter/all.500k.trimmed.highquality.noadapter.fastq --threads $NSLOTS
