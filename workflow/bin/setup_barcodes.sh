#!/bin/bash

# list of new barcodes
barcodes=("barcode02" "barcode03" "barcode04" "barcode05")

# base directory 
base_dir="."

# find all directories containing analysis of barcode01
barcode01_dirs=$(find "$base_dir" -type d -path "*/run03/barcode01")

# iterate over each directory contaning barcode01
for barcode01_path in $barcode01_dirs; do
    parent_dir=$(dirname "$barcode01_path") # get the parent directory (run03)

    for barcode in "${barcodes[@]}"; do
        new_barcode_path="$parent_dir/$barcode"
        
	# create new structure for the new barcode
        mkdir -p "$new_barcode_path"

	# copy all .sh scripts from barcode01 and change its content for each new barcode
        find "$barcode01_path" -maxdepth 1 -type f -name "*.sh" | while read -r script; do
            new_script="$new_barcode_path/$(basename "$script")"
            sed "s/barcode01/$barcode/g" "$script" > "$new_script"
        done

        echo "Created: $new_barcode_path"
    done
done

echo "Done!"
