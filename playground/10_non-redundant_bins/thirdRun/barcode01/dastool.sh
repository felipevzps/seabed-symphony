#!/bin/bash

#BSUB -q hpc
#BSUB -J dastool
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 30
#BSUB -o dastool.sh.o%J
#BSUB -e dastool.sh.e%J

source activate metagenomics

assembly=`ls -1 ../../../8_prokaryote_contigs/third_run/barcode01/prokaryote/assembly_prokaryote.fasta`

mkdir output

/usr/bin/time -v DAS_Tool -i sample_data/MetaBAT2.contigs2bin.tsv,sample_data/MaxBin2.contigs2bin.tsv,sample_data/CONCOCT.contigs2bin.tsv -l MetaBAT2,MaxBin2,CONCOCT -c $assembly -o output/DASToolRun -t 5 --write_bin_evals --write_bins --score_threshold 0.2
