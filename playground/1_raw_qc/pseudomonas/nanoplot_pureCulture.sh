#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

{ /usr/bin/time -v NanoPlot -t 2 --fastq ../0_raw/P5_1.fastq --plots dot --legacy dot --N50 -o nanoplot_pureCulture ; } 2>> nanoplot_pureCulture.sh.o
