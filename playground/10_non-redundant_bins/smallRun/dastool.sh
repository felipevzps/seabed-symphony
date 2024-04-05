#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

assembly=`ls -1 ../8_prokaryote_contigs/prokaryote/assembly_prokaryote.fasta`

mkdir output

/usr/bin/time -v DAS_Tool -i sample_data/MetaBAT2.contigs2bin.tsv,sample_data/MaxBin2.contigs2bin.tsv,sample_data/CONCOCT.contigs2bin.tsv -l MetaBAT2,MaxBin2,CONCOCT -c $assembly -o output/DASToolRun -t $NSLOTS --write_bin_evals --write_bins --score_threshold 0.5 
