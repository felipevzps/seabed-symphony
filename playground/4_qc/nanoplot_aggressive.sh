#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

/usr/bin/time -v NanoPlot -t $NSLOTS --fastq ../3_adapter_removal/aggressive_filter/all.500k.trimmed.highquality.noadapter.fastq --plots dot --legacy dot --N50 -o aggressive_filter
