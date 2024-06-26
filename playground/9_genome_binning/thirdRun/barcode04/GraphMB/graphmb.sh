#!/bin/bash

#BSUB -q hpc
#BSUB -J graphmb
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 3:00
#BSUB -o graphmb.sh.o%J
#BSUB -e graphmb.sh.e%J

source activate graphmb

assembly=assembly

/usr/bin/time -v graphmb --assembly $assembly --outdir bins/ --assembly_name assembly_prokaryote.fasta --graph_file assembly_graph.gfa --depth depth.txt --numcores 10 --contignodes --writebins
