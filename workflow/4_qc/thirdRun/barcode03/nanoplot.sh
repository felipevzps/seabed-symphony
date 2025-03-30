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

/usr/bin/time -v NanoPlot -t 5 --fastq ../../../3_adapter_removal/third_run/barcode03/soft_filter/barcode03.trimmed.highquality.noadapter.fastq/BC03.fastq --plots dot --legacy dot --N50 -o nanoplot
