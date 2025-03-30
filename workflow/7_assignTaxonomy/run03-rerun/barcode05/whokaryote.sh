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

input="/work3/fevape/rerun-analysis/5_metagenomeAssembly/run03/barcode05/assembly/assembly.fasta"

/usr/bin/time -v whokaryote.py --contigs $input --outdir output --threads 4
