#!/bin/bash

#BSUB -q hpc
#BSUB -J whokaryote
#BSUB -n 4
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=2GB]"
#BSUB -W 3:00
#BSUB -o whokaryote_scenarioB.sh.o%J
#BSUB -e whokaryote_scenarioB.sh.e%J

source activate whokaryote

/usr/bin/time -v whokaryote.py --contigs ../../5_assembly/scenarioB/scenarioB/assembly.fasta --outdir scenarioB --threads 4
