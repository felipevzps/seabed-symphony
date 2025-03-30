#!/bin/bash

#BSUB -q hpc
#BSUB -J antismash[1-40]%2
#BSUB -n 20
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 72:00
#BSUB -o antismash.sh.o%J
#BSUB -e antismash.sh.e%J

source activate antismash

bakta_annot=../../../13_bakta/third_run/barcode03/output/
genome=`ls -1 $bakta_annot | head -n $LSB_JOBINDEX | tail -n 1`
genbank=../../../13_bakta/third_run/barcode03/output/${genome}/${genome}.gbff

mkdir -p output
mkdir output/$genome

/usr/bin/time -v antismash $genbank --databases /work3/fevape/database/antismash -t bacteria -c 20 --output-dir output/$genome --output-basename $genome --clusterhmmer --cb-general --cb-knownclusters --pfam2go
