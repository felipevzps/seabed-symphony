#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 10

module load miniconda3
conda activate metagenomics

Hjor=Hjor/

/usr/bin/time -v graphmb --assembly $Hjor --outdir Hjor_bins/ --assembly_name assembly.fasta --graph_file assembly_graph.gfa --depth Hjor_depth.txt --numcores $NSLOTS --contignodes --writebins 
