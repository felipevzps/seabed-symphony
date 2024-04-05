#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

# Extract prokaryote contigs from assembly
{ /usr/bin/time -v ./extractContigsFromWhokaryote.py -i ../5_assembly/1_polishing/assembly.fasta -p ../7_assign_taxonomy/output/prokaryote_contig_headers.txt -o prokaryote ; } 2>> extractProkaryoteContigsFromWhokaryote.sh.o 

