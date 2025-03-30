#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

bam=`ls -1 ../mapping/mapped_sorted.bam`

/usr/bin/time -v jgi_summarize_bam_contig_depths --outputDepth depth.txt $bam
