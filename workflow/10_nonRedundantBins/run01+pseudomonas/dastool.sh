#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

assembly=`ls -1 ../../8_prokaryote_contigs/prokaryote_combined/assembly_prokaryote.fasta`

mkdir output

{ /usr/bin/time -v DAS_Tool -i sample_data/MetaBAT2.contigs2bin.tsv,sample_data/MaxBin2.contigs2bin.tsv,sample_data/CONCOCT.contigs2bin.tsv,sample_data/GraphMB.contigs2bin.tsv -l MetaBAT2,MaxBin2,CONCOCT,GraphMB -c $assembly -o output/DASToolRun -t 5 --write_bin_evals --write_bins --score_threshold 0.5 ; } 2>> dastool.sh.o 
