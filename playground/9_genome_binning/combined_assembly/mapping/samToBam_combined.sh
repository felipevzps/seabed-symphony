#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

{
	/usr/bin/time -v samtools view -b -o mapped_combined.bam mapped_combined.sam ;
	/usr/bin/time -v samtools sort -o mapped_sorted_combined.bam mapped_combined.bam ;
	/usr/bin/time -v samtools index mapped_sorted_combined.bam ;
} 2>> samToBam_combined.sh.o
