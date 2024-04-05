#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

assembly=`ls -1 ../../../8_prokaryote_contigs/prokaryote/assembly_prokaryote.fasta`

mkdir bins

{ /usr/bin/time -v metabat2 -i $assembly -a depth.txt -o bins/bins -t 5 ; } 2>> metabat.sh.o 

