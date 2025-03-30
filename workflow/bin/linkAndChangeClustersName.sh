#!/bin/bash

#BSUB -q hpc
#BSUB -J linkAndChangeClustersName
#BSUB -n 1
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=1GB]"
#BSUB -W 30
#BSUB -o linkAndChangeClustersName.sh.o%J
#BSUB -e linkAndChangeClustersName.sh.e%J

# directory where the genome folders are located
genomes_dir="/work3/fevape/rerun-analysis/14_BGCs/run03/barcode02/output/"

# loop through all genome folders
for genome_dir in "$genomes_dir"/*; do
    # extract the genome name from the folder
    genome=$(basename "$genome_dir")

    # find all gbk files containing "region" in their name inside the genome folder
    find "$genome_dir" -type f -name "*region*.gbk" | while read -r gbk_file; do
        # extract the file name without extension
        filename=$(basename "$gbk_file" .gbk)
        # Extract the region number from the file
        region_number=$(echo "$filename" | grep -oP 'region\d+')

        # Extract the contig number from the file
        contig_number=$(echo "$filename" | grep -oP 'contig_\d+')

        # Create the new file name
        new_filename="${genome}.${region_number}.${contig_number}.gbk"

        # Create the symbolic link with the new name in the current directory
        ln -s "$gbk_file" "./$new_filename"
    done
done
