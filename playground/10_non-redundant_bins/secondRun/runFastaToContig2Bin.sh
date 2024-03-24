#!/bin/bash

#BSUB -q hpc
#BSUB -J parse_dastool
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o parse_dastool.sh.o%J
#BSUB -e parse_dastool.sh.e%J

source activate metagenomics

mkdir sample_data

# Converting MetaBAT2 fasta output into tab separated contigs2bin file
/usr/bin/time -v Fasta_to_Contig2Bin.sh -i ../../9_genome_binning/MetaBAT2/secondRun/bins/ -e fa > sample_data/MetaBAT2.contigs2bin.tsv

# Converting MaxBin fasta output into tab separated contigs2bin file
/usr/bin/time -v Fasta_to_Contig2Bin.sh -i ../../9_genome_binning/MaxBin2/secondRun/bins/ -e fasta > sample_data/MaxBin2.contigs2bin.tsv

# Converting CONCOCT fasta output into tab separated contigs2bin file
/usr/bin/time -v perl -pe "s/,/\tCONCOCT./g;" ../../9_genome_binning/CONCOCT/secondRun/concoct_output/clustering_merged.csv > sample_data/CONCOCT.contigs2bin.tsv
