#!/bin/bash

#BSUB -q hpc
#BSUB -J checkm
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 3:00
#BSUB -o checkm.sh.o%J
#BSUB -e checkm.sh.e%J

source activate checkm

bins=../../10_non-redundant_bins/secondRun/output/DASToolRun_DASTool_bins/

/usr/bin/time -v checkm lineage_wf -x fa -t 10 --tab_table $bins output/ -f output/checkm.tsv 

