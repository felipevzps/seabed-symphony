#!/bin/bash

conda activate /home/fevape/miniconda3/envs/whokaryote

{ /usr/bin/time -v whokaryote.py --contigs ../5_assembly/1_polishing_combined/assembly.fasta --outdir output_combined --threads 4 ; } 2>> whokaryote_combined.sh.o
