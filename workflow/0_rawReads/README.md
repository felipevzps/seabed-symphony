# samples description

### run01

* 40GB samples sequenced by Kristina (`all.fastq`)

### runSmall

* a subset of 500k reads from run01 (`all.500k.fastq`)

### pseudomonas

* pure pseudomonas culture data from Adele Marie (`P5_1.fastq`)

### run01+pseudomonas (scenario A)

* sample from run01 combined with pseudomonas (P5)
	* generated for comparing size-selected vs non-size selected samples (given that non-selected is much deeper sequenced)

### runB (scenario B)

* same data as run01+pseudomonas, except the sequencing depth was normalized
	* generated for comparing size-selected vs non-size selected samples, but with equal depth

### run02

* second batch of samples sequenced by Kristina (`second_run.fastq`)
* path of origin (gridion): /data/231205_Metagenomes_sediment_Kristina/KK_1903_N3/no_sample/20240319_1550_X1_FAX80973_b466842e/fastq_pass/ 

### run03

* ~100GB sequencing dataset using 05 barcodes (one for each experiment)
* path of origin (gridion): /data/2024-05-03-Sediment-Promethion/2024-05-03-Sediment-Promethion/20240503_1728_P2S-01248-A_PAQ61173_ffaf27f4/fastq_pass

barcode01 - DNA extracted from a vacuum centrifuged sediment sample (VCS4)
barcode02 - The same vacuum centrifuged sample (VCS4), but with 1% Pseudomonas Protegens DTU 9.1
barcode03 - Size selected DNA from VCS4
barcode04 - Size selected DNA from VCS4, but with 1% Pseudomonas Protegens DTU 9.1
barcode05 - DNA extracted from a vacuum centrifuged sediment sample using a different bead beating method (VTLS)

### run03-rerun

* same data as run03:

barcode01 - DNA extracted from a vacuum centrifuged sediment sample (VCS4)
barcode02 - The same vacuum centrifuged sample (VCS4), but with 1% Pseudomonas Protegens DTU 9.1
barcode03 - Size selected DNA from VCS4
barcode04 - Size selected DNA from VCS4, but with 1% Pseudomonas Protegens DTU 9.1
barcode05 - DNA extracted from a vacuum centrifuged sediment sample using a different bead beating method (VTLS)
