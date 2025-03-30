#!/bin/bash

#BSUB -q hpc
#BSUB -J gtdb
#BSUB -n 30
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=12GB]"
#BSUB -W 72:00
#BSUB -o gtdb.sh.o%J
#BSUB -e gtdb.sh.e%J

source activate gtdbtk-2.3.2

bins="/work3/fevape/rerun-analysis/10_nonRedundantBins/run03/barcode05/output/DASToolRun_DASTool_bins/"

/usr/bin/time -v gtdbtk classify_wf --genome_dir $bins --out_dir output --mash_db mash_db --extension fa --cpus 30
