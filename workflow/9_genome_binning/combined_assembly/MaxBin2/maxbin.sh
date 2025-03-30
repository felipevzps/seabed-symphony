#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

reads=`ls -1 ../../../3_adapter_removal/soft_filter/combined.trimmed.highquality.noadapter.fastq`
assembly=`ls -1 ../../../8_prokaryote_contigs/prokaryote_combined/assembly_prokaryote.fasta`
depth=`ls -1 ../../MetaBAT2/combined_assembly/depth.txt`

mkdir bins

# removed: reads $reads - for first run
{ /usr/bin/time -v run_MaxBin.pl -contig $assembly -abund $depth -out bins/bins -thread 5 ; } 2>> maxbin.sh.o 

