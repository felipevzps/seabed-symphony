#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

bam=`ls -1 ../../mapping/combined_assembly/mapped_sorted_combined.bam`

{ /usr/bin/time -v jgi_summarize_bam_contig_depths --outputDepth depth.txt $bam ; } 2>> bamDepths.sh.o 
