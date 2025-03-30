#!/bin/bash

#BSUB -q hpc
#BSUB -J nanoplot
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=5GB]"
#BSUB -W 50
#BSUB -o nanoplot.sh.o%J
#BSUB -e nanoplot.sh.e%J

source activate metagenomics

input="/work3/fevape/rerun-analysis/0_rawReads/run03/barcode02/barcode02.fastq"

/usr/bin/time -v NanoPlot -t 5 --fastq $input  --plots dot --legacy dot --N50 -o nanoplot
