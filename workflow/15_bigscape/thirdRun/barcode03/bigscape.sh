#!/bin/bash

#BSUB -q hpc
#BSUB -J bigscape
#BSUB -n 20
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=10GB]"
#BSUB -W 20:00
#BSUB -o bigscape.sh.o%J
#BSUB -e bigscape.sh.e%J

source activate bigscape

genbank=gbks

/usr/bin/time -v bigscape -i $genbank -o output --pfam_dir /work3/fevape/database/pfam -c 20 --verbose --include_singletons --mode auto --mibig
