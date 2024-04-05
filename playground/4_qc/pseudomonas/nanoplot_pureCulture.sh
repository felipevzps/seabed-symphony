#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

{ /usr/bin/time -v NanoPlot -t 2 --fastq ../3_adapter_removal/soft_filter/P5_1.trimmed.highquality.noadapter.fastq --plots dot --legacy dot --N50 -o nanoplot_pureCulture ; } 2>> nanoplot_pureCulture.sh.o

