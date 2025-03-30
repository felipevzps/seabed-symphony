#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

{
	/usr/bin/time -v samtools view -b -o mapped.bam mapped.sam ;
	/usr/bin/time -v samtools sort -o mapped_sorted.bam mapped.bam ;
	/usr/bin/time -v samtools index mapped_sorted.bam ;
} 2>> samToBam.sh.o
