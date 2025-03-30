#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

in=`ls -1 ../../3_adapter_removal/soft_filter/all.500k.trimmed.highquality.noadapter.fastq`
assembly=`ls -1 ../../8_prokaryote_contigs/prokaryote/assembly_prokaryote.fasta`

# Mapping reads to assembly
#/usr/bin/time -v bbmap.sh ref=$assembly in=$in out=mapped.sam threads=$NSLOTS
# Error: cannot map long reads - exceeds the limit of 600

# Reformat long reads to max 600 length 
# trd: Trim the names of reads after the first whitespace
/usr/bin/time -v reformat.sh in=$in out=mapped_reads.fasta fastareadlen=600 trd
/usr/bin/time -v bbmap.sh ref=$assembly in=mapped_reads.fasta out=mapped.sam threads=$NSLOTS 
