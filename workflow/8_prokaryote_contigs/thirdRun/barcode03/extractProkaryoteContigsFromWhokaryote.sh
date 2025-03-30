#!/bin/bash

#BSUB -q hpc
#BSUB -J extract_whokaryote
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o whokaryote.sh.o%J
#BSUB -e whokaryote.sh.e%J

source activate metagenomics

/usr/bin/time -v ../.././extractContigsFromWhokaryote.py -i ../../../5_assembly/third_run/barcode03/barcode03/assembly.fasta -p ../../../7_assign_taxonomy/third_run/barcode03/output/prokaryote_contig_headers.txt -o prokaryote
