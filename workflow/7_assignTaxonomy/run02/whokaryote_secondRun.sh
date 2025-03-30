#!/bin/bash

#BSUB -q hpc
#BSUB -J whokaryote_secondRun
#BSUB -n 4
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=2GB]"
#BSUB -W 3:00
#BSUB -o whokaryote_secondRun.sh.o%J
#BSUB -e whokaryote_secondRun.sh.e%J

source activate whokaryote

/usr/bin/time -v whokaryote.py --contigs ../5_assembly/secondRun/assembly.fasta --outdir secondRun --threads 4
