#!/bin/bash

#BSUB -q hpc
#BSUB -J bakta[1-1]%3
#BSUB -n 10
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 72:00
#BSUB -o bakta.sh.o%J
#BSUB -e bakta.sh.e%J

source activate bakta

genome_dir="/work3/fevape/rerun-analysis/10_nonRedundantBins/run03/barcode01/output/DASToolRun_DASTool_bins/"
genome=`ls -1 $genome_dir | head -n $LSB_JOBINDEX | tail -n 1`
output=`basename ${genome/.fa}`
database="/work3/fevape/database/bakta/db"

/usr/bin/time -v bakta --db $database --prefix $output --output output/$output --meta --threads 10 --keep-contig-headers $genome_dir/$genome
