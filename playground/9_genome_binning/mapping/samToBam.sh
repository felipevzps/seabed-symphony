#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

/usr/bin/time -v samtools view -b -o mapped.bam mapped.sam
/usr/bin/time -v samtools sort -o mapped_sorted.bam mapped.bam
/usr/bin/time -v samtools index mapped_sorted.bam
