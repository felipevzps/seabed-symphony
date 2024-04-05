#!/bin/bash

conda activate /home/fevape/miniconda3/envs/graphmb

assembly=assembly

{ /usr/bin/time -v graphmb --assembly $assembly --outdir bins/ --assembly_name assembly_prokaryote.fasta --graph_file assembly_graph.gfa --depth depth.txt --numcores 5 --contignodes --writebins ; } 2>> graphmb.sh.o 
