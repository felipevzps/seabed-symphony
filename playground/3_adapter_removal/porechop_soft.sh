#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

# dont separate barcodes
#/usr/bin/time -v porechop -i ../2_trimmed/soft_filter/all.500k.trimmed.highquality.fastq -o soft_filter/all.500k.trimmed.highquality.noadapter.fastq --threads $NSLOTS

# separate files into barcodes
/usr/bin/time -v porechop -i ../2_trimmed/soft_filter/all.500k.trimmed.highquality.fastq -o soft_filter/all.500k.trimmed.highquality.noadapter.fastq --barcode_threshold 75 --barcode_diff 5 --adapter_threshold 95 --threads $NSLOTS
# --barcode_threshold 80
# Error: no barcodes were found, so Porechop cannot perform barcode demultiplexing
