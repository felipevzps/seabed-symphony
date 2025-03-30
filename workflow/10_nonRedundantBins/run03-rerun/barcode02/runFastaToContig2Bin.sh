#!/bin/bash

#BSUB -q hpc
#BSUB -J runFastaToContig2Bin
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o runFastaToContig2Bin.sh.o%J
#BSUB -e runFastaToContig2Bin.sh.e%J

source activate metagenomics

mkdir sample_data

MetaBAT2="/work3/fevape/rerun-analysis/9_genomeBinning/MetaBAT2/run03/barcode02/bins/"
MaxBin2="/work3/fevape/rerun-analysis/9_genomeBinning/MaxBin2/run03/barcode02/bins/"
CONCOCT="/work3/fevape/rerun-analysis/9_genomeBinning/CONCOCT/run03/barcode02/concoct_output/clustering_merged.csv"

# Converting MetaBAT2 fasta output into tab separated contigs2bin file
/usr/bin/time -v Fasta_to_Contig2Bin.sh -i $MetaBAT2 -e fa > sample_data/MetaBAT2.contigs2bin.tsv

# Converting MaxBin fasta output into tab separated contigs2bin file
/usr/bin/time -v Fasta_to_Contig2Bin.sh -i $MaxBin2 -e fasta > sample_data/MaxBin2.contigs2bin.tsv

# Converting CONCOCT fasta output into tab separated contigs2bin file
/usr/bin/time -v perl -pe "s/,/\tCONCOCT./g;" $CONCOCT > sample_data/CONCOCT.contigs2bin.tsv
