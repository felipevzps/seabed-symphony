#!/bin/bash

#BSUB -q hpc
#BSUB -J bakta[1-80]%3
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 72:00
#BSUB -o bakta.sh.o%J
#BSUB -e bakta.sh.e%J

source activate bakta

genome_dir=../../../10_non-redundant_bins/third_run/barcode02/output/DASToolRun_DASTool_bins/
genome=`ls -1 $genome_dir | head -n $LSB_JOBINDEX | tail -n 1`
output=`basename ${genome/.fa}`

/usr/bin/time -v bakta --db /work3/fevape/database/bakta/db/ --prefix $output --output output/$output --meta --threads 10 --keep-contig-headers $genome_dir/$genome
