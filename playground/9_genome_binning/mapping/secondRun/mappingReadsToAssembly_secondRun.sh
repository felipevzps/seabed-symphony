#!/bin/bash

#BSUB -q hpc
#BSUB -J mappingReadsToAssembly_secondRun
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 30:00
#BSUB -o mappingReadsToAssembly_secondRun.sh.o%J
#BSUB -e mappingReadsToAssembly_secondRun.sh.e%J

source activate metagenomics

in=`ls -1 ../../../3_adapter_removal/soft_filter/second_run.trimmed.highquality.noadapter.fastq`
assembly=`ls -1 ../../../8_prokaryote_contigs/prokaryote_secondRun/assembly_prokaryote.fasta`

# Reformat long reads to max 600 length 
# trd: Trim the names of reads after the first whitespace
/usr/bin/time -v reformat.sh in=$in out=mapped_reads_secondRun.fasta fastareadlen=600 trd
/usr/bin/time -v bbmap.sh ref=$assembly in=mapped_reads_secondRun.fasta out=mapped_secondRun.sam threads=10
