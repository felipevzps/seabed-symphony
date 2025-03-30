#!/bin/bash

conda activate /home/fevape/miniconda3/envs/metagenomics

{ /usr/bin/time -v NanoPlot -t 2 --fastq ../0_raw/all.fastq --plots dot --legacy dot --N50 -o nanoplot ; } 2>> nanoplot.sh.o

