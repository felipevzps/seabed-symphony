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

assembly="/work3/fevape/rerun-analysis/5_metagenomeAssembly/run03/barcode01/assembly/assembly.fasta"
headers="/work3/fevape/rerun-analysis/7_assignTaxonomy/run03/barcode01/output/prokaryote_contig_headers.txt"

/usr/bin/time -v /work3/fevape/rerun-analysis/bin/./extractContigsFromWhokaryote.py --i $assembly --p $headers --o prokaryote
