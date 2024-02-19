#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

reads=`ls -1 ../../3_adapter_removal/soft_filter/all.500k.trimmed.highquality.noadapter.fastq`
assembly=`ls -1 ../../8_prokaryote_contigs/prokaryote/assembly_prokaryote.fasta`
depth=`ls -1 ../MetaBAT2/depth.txt`

mkdir bins
# removed: reads $reads - for first run
/usr/bin/time -v run_MaxBin.pl -contig $assembly -abund $depth -out bins/bins -thread $NSLOTS
