#!/bin/bash

#BSUB -q hpc
#BSUB -J nanoplot
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=2GB]"
#BSUB -W 50
#BSUB -o nanoplot.sh.o%J
#BSUB -e nanoplot.sh.e%J

source activate metagenomics

input="/work3/fevape/rerun-analysis/3_adapterRemoval/run03/barcode04/soft_filter/barcode04.trimmed.highquality.noadapter.fastq/BC04.fastq"

/usr/bin/time -v NanoPlot -t 5 --fastq $input --plots dot --legacy dot --N50 -o nanoplot
