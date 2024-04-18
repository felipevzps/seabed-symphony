#!/bin/bash

#BSUB -q hpc
#BSUB -J nanoplot_scenarioB
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=2GB]"
#BSUB -W 50
#BSUB -o nanoplot_scenarioB.sh.o%J
#BSUB -e nanoplot_scenarioB.sh.e%J

source activate metagenomics

/usr/bin/time -v NanoPlot -t 5 --fastq ../../3_adapter_removal/scenarioB/soft_filter/rescued_subsampled_all_fastq_pseudomonas.trimmed.highquality.noadapter.fastq --plots dot --legacy dot --N50 -o nanoplot_scenarioB
