#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

in=`ls -1 ../../3_adapter_removal/soft_filter/all.trimmed.highquality.noadapter.fastq`
assembly=`ls -1 ../../8_prokaryote_contigs/prokaryote/assembly_prokaryote.fasta`

# Reformat long reads to max 600 length 
# trd: Trim the names of reads after the first whitespace
{
	/usr/bin/time -v reformat.sh in=$in out=mapped_reads.fasta fastareadlen=600 trd ;
	/usr/bin/time -v bbmap.sh ref=$assembly in=mapped_reads.fasta out=mapped.sam threads=4 ;
} 2>> mappingReadsToAssembly.sh.o 
