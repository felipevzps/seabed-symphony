#!/bin/bash

#BSUB -q hpc
#BSUB -J mapping
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 30:00
#BSUB -o mappingReadsToAssembly_scenarioB.sh.o%J
#BSUB -e mappingReadsToAssembly_scenarioB.sh.e%J

source activate metagenomics

in=`ls -1 ../../../3_adapter_removal/scenarioB/soft_filter/rescued_subsampled_all_fastq_pseudomonas.trimmed.highquality.noadapter.fastq`
assembly=`ls -1 ../../../8_prokaryote_contigs/scenarioB/prokaryote_scenarioB/assembly_prokaryote.fasta`

# Reformat long reads to max 600 length 
# trd: Trim the names of reads after the first whitespace
/usr/bin/time -v reformat.sh in=$in out=mapped_reads_scenarioB.fasta fastareadlen=600 trd
/usr/bin/time -v bbmap.sh ref=$assembly in=mapped_reads_scenarioB.fasta out=mapped_scenarioB.sam threads=10
