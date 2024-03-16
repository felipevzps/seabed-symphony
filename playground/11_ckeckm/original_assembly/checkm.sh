#!/bin/bash

conda activate /home/fevape/miniconda3/envs/checkm

bins=../../10_non-redundant_bins/original_assembly/output/DASToolRun_DASTool_bins/

{ /usr/bin/time -v checkm lineage_wf -x fa --reduced_tree -t 5 --tab_table $bins output/ -f output/checkm.tsv ; } 2>> checkm.sh.o 
