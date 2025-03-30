#!/bin/bash

#BSUB -q hpc
#BSUB -J extract_whokaryote
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o whokaryote_scenarioB.sh.o%J
#BSUB -e whokaryote_scenarioB.sh.e%J

source activate metagenomics

/usr/bin/time -v .././extractContigsFromWhokaryote.py -i ../../5_assembly/scenarioB/scenarioB/assembly.fasta -p ../../7_assign_taxonomy/scenarioB/scenarioB/prokaryote_contig_headers.txt -o prokaryote_scenarioB
