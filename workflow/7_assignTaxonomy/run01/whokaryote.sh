#!/bin/bash

conda activate /home/fevape/miniconda3/envs/whokaryote

{ /usr/bin/time -v whokaryote.py --contigs ../5_assembly/1_polishing/assembly.fasta --outdir output --threads 4 ; } 2>> whokaryote.sh.o
