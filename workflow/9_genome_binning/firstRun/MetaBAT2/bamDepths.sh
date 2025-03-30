#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

bam=`ls -1 ../../mapping/original_assembly/mapped_sorted.bam`

{ /usr/bin/time -v jgi_summarize_bam_contig_depths --outputDepth depth.txt $bam ; } 2>> bamDepths.sh.o 
