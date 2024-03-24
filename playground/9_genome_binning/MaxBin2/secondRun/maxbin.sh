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

reads=`ls -1 ../../../3_adapter_removal/soft_filter/second_run.trimmed.highquality.noadapter.fastq`
assembly=`ls -1 ../../../8_prokaryote_contigs/prokaryote_secondRun/assembly_prokaryote.fasta`
depth=`ls -1 ../../MetaBAT2/secondRun/depth.txt`

mkdir bins

# removed: reads $reads - for first run
/usr/bin/time -v run_MaxBin.pl -contig $assembly -abund $depth -out bins/bins -thread 5
