#!/bin/bash

#BSUB -q hpc
#BSUB -J seqkit_secondRun_stats
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 15
#BSUB -o seqkit_secondRun_stats.sh.o%J
#BSUB -e seqkit_secondRun_stats.sh.e%J

source activate metagenomics

/usr/bin/time -v seqkit stats ../3_adapter_removal/soft_filter/second_run.trimmed.highquality.noadapter.fastq >> seqkit_secondRun_stats.txt
