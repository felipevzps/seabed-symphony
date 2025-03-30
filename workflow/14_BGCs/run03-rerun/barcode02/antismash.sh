#!/bin/bash

#BSUB -q hpc
#BSUB -J antismash[1-85]%2
#BSUB -n 20
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 72:00
#BSUB -o antismash.sh.o%J
#BSUB -e antismash.sh.e%J

source activate antismash

bakta_annot="/work3/fevape/rerun-analysis/13_bakta/run03/barcode02/output/"
genome=`ls -1 $bakta_annot | head -n $LSB_JOBINDEX | tail -n 1`
genbank="/work3/fevape/rerun-analysis/13_bakta/run03/barcode02/output/${genome}/${genome}.gbff"
database="/work3/fevape/database/antismash"

mkdir -p output
mkdir output/$genome

/usr/bin/time -v antismash $genbank --databases $database -t bacteria -c 20 --output-dir output/$genome --output-basename $genome --clusterhmmer --cb-general --cb-knownclusters --pfam2go
