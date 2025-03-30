#!/bin/bash

#BSUB -q hpc
#BSUB -J maxbin
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 1:00
#BSUB -o maxbin.sh.o%J
#BSUB -e maxbin.sh.e%J

source activate metagenomics

reads="/work3/fevape/rerun-analysis/3_adapterRemoval/run03/barcode02/soft_filter/barcode02.trimmed.highquality.noadapter.fastq/BC02.fastq"
assembly="/work3/fevape/rerun-analysis/8_prokaryoteContigs/run03/barcode02/prokaryote/assembly_prokaryote.fasta"
depth="/work3/fevape/rerun-analysis/9_genomeBinning/MetaBAT2/run03/barcode02/depth.txt"

mkdir bins

# removed: reads $reads - for first run
/usr/bin/time -v run_MaxBin.pl -contig $assembly -abund $depth -out bins/bins -thread 5
