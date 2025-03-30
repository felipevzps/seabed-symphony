#!/bin/bash

#BSUB -q hpc
#BSUB -J whokaryote_secondRun
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o whokaryote_secondRun.sh.o%J
#BSUB -e whokaryote_secondRun.sh.e%J

source activate metagenomics

/usr/bin/time -v ./extractContigsFromWhokaryote.py -i ../5_assembly/secondRun/assembly.fasta -p ../7_assign_taxonomy/secondRun/prokaryote_contig_headers.txt -o prokaryote_secondRun
