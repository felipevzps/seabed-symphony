#!/bin/bash

#BSUB -q hpc
#BSUB -J bakta
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 72:00
#BSUB -o bakta.sh.o%J
#BSUB -e bakta.sh.e%J

source activate bakta

assembly=assembly/assembly.fasta

/usr/bin/time -v bakta --db /work3/fevape/database/bakta/db/ --prefix pseudomonas --output output/pseudomonas --threads 10 --keep-contig-headers $assembly
