#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

module load miniconda3
conda activate metagenomics

# Extract prokaryote contigs from assembly
/usr/bin/time -v ./extractContigsFromWhokaryote.py -i ../5_assembly/soft_filter/assembly.fasta -p ../7_assign_taxonomy/whokaryote_output/prokaryote_contig_headers.txt -o prokaryote

# Extract eukaryote contigs from assembly
/usr/bin/time -v ./extractContigsFromWhokaryote.py -i ../5_assembly/soft_filter/assembly.fasta -e ../7_assign_taxonomy/whokaryote_output/eukaryote_contig_headers.txt -o eukaryote
