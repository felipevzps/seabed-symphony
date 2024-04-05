#!/bin/bash

#BSUB -q hpc
#BSUB -J nanoplot_secondRun
#BSUB -n 2
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=2GB]"
#BSUB -W 50
#BSUB -o nanoplot_secondRun.sh.o%J
#BSUB -e nanoplot_secondRun.sh.e%J

source activate metagenomics

/usr/bin/time -v NanoPlot -t 2 --fastq ../3_adapter_removal/soft_filter/second_run.trimmed.highquality.noadapter.fastq --plots dot --legacy dot --N50 -o nanoplot_secondRun
