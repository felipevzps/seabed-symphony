#!/bin/bash

#BSUB -q hpc
#BSUB -J whokaryote
#BSUB -n 4
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=2GB]"
#BSUB -W 3:00
#BSUB -o whokaryote.sh.o%J
#BSUB -e whokaryote.sh.e%J

source activate whokaryote

/usr/bin/time -v whokaryote.py --contigs ../../../5_assembly/third_run/barcode02/barcode02/assembly.fasta --outdir output --threads 4
