#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

assembly=`ls -1 ../../8_prokaryote_contigs/prokaryote/assembly_prokaryote.fasta`

mkdir bins
/usr/bin/time -v metabat2 -i $assembly -a depth.txt -o bins/bins -t $NSLOTS
