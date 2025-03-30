#!/bin/bash

#BSUB -q hpc
#BSUB -J metabat
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 1:00
#BSUB -o metabat.sh.o%J
#BSUB -e metabat.sh.e%J

source activate metagenomics

assembly="/work3/fevape/rerun-analysis/8_prokaryoteContigs/run03/barcode04/prokaryote/assembly_prokaryote.fasta"
mkdir bins

/usr/bin/time -v metabat2 -i $assembly -a depth.txt -o bins/bins -t 5
