#!/bin/bash

#BSUB -q hpc
#BSUB -J concoct
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 1:00
#BSUB -o concoct.sh.o%J
#BSUB -e concoct.sh.e%J

source activate metagenomics

assembly="/work3/fevape/rerun-analysis/8_prokaryoteContigs/run03/barcode04/prokaryote/assembly_prokaryote.fasta"
bam="/work3/fevape/rerun-analysis/9_genomeBinning/mapping/run03/barcode04/mapped_sorted.bam"

# Cut contigs into smaller parts
/usr/bin/time -v cut_up_fasta.py $assembly -c 10000 -o 0 --merge_last -b contigs_10K.bed > contigs_10K.fa
	
# Generate table with coverage depth
/usr/bin/time -v concoct_coverage_table.py contigs_10K.bed $bam > coverage_table.tsv
	
# Run COCOCT
/usr/bin/time -v concoct --composition_file contigs_10K.fa --coverage_file coverage_table.tsv -b concoct_output/ -t 5

# Merge subcontig clustering into original contig clustering:
/usr/bin/time -v merge_cutup_clustering.py concoct_output/clustering_gt1000.csv > concoct_output/clustering_merged.csv

# Extract bins as individual FASTA
mkdir bins
/usr/bin/time -v extract_fasta_bins.py $assembly concoct_output/clustering_merged.csv --output_path bins
