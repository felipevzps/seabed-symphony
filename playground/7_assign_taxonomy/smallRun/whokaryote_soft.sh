#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 20

module load miniconda3
conda activate metagenomics

/usr/bin/time -v whokaryote.py --contigs ../5_assembly/soft_filter/assembly.fasta --outdir whokaryote_output --threads $NSLOTS
