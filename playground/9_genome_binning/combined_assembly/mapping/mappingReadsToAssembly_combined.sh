#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

in=`ls -1 ../../../3_adapter_removal/soft_filter/combined.trimmed.highquality.noadapter.fastq`
assembly=`ls -1 ../../../8_prokaryote_contigs/prokaryote_combined/assembly_prokaryote.fasta`

# Reformat long reads to max 600 length 
# trd: Trim the names of reads after the first whitespace
{
	/usr/bin/time -v reformat.sh in=$in out=mapped_reads_combined.fasta fastareadlen=600 trd ;
	/usr/bin/time -v bbmap.sh ref=$assembly in=mapped_reads_combined.fasta out=mapped_combined.sam threads=4 ;
} 2>> mappingReadsToAssembly_combined.sh.o 
