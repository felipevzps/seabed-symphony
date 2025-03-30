#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

mkdir sample_data

{
	# Converting MetaBAT2 fasta output into tab separated contigs2bin file
	/usr/bin/time -v Fasta_to_Contig2Bin.sh -i ../../9_genome_binning/MetaBAT2/original_assembly/bins/ -e fa > sample_data/MetaBAT2.contigs2bin.tsv ;

	# Converting MaxBin fasta output into tab separated contigs2bin file
	/usr/bin/time -v Fasta_to_Contig2Bin.sh -i ../../9_genome_binning/MaxBin2/original_assembly/bins/ -e fasta > sample_data/MaxBin2.contigs2bin.tsv ; 

	# Converting CONCOCT fasta output into tab separated contigs2bin file
	/usr/bin/time -v perl -pe "s/,/\tCONCOCT./g;" ../../9_genome_binning/CONCOCT/original_assembly/concoct_output/clustering_merged.csv > sample_data/CONCOCT.contigs2bin.tsv ;
} 2>> runFastaToContig2Bin.sh.o 
