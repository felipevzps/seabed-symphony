#!/bin/bash

#BSUB -q hpc
#BSUB -J mapping
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 30:00
#BSUB -o mappingReadsToAssembly.sh.o%J
#BSUB -e mappingReadsToAssembly.sh.e%J

source activate metagenomics

in=`ls -1 ../../../../3_adapter_removal/third_run/barcode05/soft_filter/barcode05.trimmed.highquality.noadapter.fastq/BC05.fastq`
assembly=`ls -1 ../../../../8_prokaryote_contigs/third_run/barcode05/prokaryote/assembly_prokaryote.fasta`

# Reformat long reads to max 600 length 
# trd: Trim the names of reads after the first whitespace
/usr/bin/time -v reformat.sh in=$in out=mapped_reads.fasta fastareadlen=600 trd
/usr/bin/time -v bbmap.sh ref=$assembly in=mapped_reads.fasta out=mapped.sam threads=10
