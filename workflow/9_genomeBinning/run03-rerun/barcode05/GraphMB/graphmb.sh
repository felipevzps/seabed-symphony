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

mkdir -p assembly

ln -s "/work3/fevape/rerun-analysis/5_metagenomeAssembly/run03/barcode05/assembly/assembly_graph.gfa" assembly/assembly_graph.gfa
ln -s "/work3/fevape/rerun-analysis/8_prokaryoteContigs/run03/barcode05/prokaryote/assembly_prokaryote.fasta" assembly/assembly_prokaryote.fasta
ln -s "/work3/fevape/rerun-analysis/9_genomeBinning/MetaBAT2/run03/barcode05/depth.txt" assembly/depth.txt

assembly=assembly

/usr/bin/time -v graphmb --assembly $assembly --outdir bins/ --assembly_name assembly_prokaryote.fasta --graph_file assembly_graph.gfa --depth depth.txt --numcores 10 --contignodes --writebins
