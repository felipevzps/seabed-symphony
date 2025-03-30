#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

# Extract prokaryote contigs from assembly combined
{ /usr/bin/time -v ./extractContigsFromWhokaryote.py -i ../5_assembly/1_polishing_combined/assembly.fasta -p ../7_assign_taxonomy/output_combined/prokaryote_contig_headers.txt -o prokaryote_combined ; } 2>> extractProkaryoteContigsFromWhokaryote_combined.sh.o 

