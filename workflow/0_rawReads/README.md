# samples description

## run01

* 40GB samples sequenced by Kristina 
* file: `all.fastq`
  
## runSmall

* a subset of 500k reads from run01 
* file: `all.500k.fastq`
  
## pseudomonas (P5)

* pure pseudomonas culture sequenced by Adele Marie
* file: `P5_1.fastq`
  
## run01+pseudomonas (scenario A)

* sample from run01 combined with pseudomonas (P5)
>[!NOTE]
>generated for comparing **size-selected vs non-size selected samples**  
>given that non-selected is much deeper sequenced  

## runB (scenario B)

* same data as run01+pseudomonas, except the sequencing depth was normalized
>[!NOTE]
>generated for comparing **size-selected vs non-size selected samples**, but with equal depth

## run02

* second batch of samples sequenced by Kristina  
* file: `second_run.fastq`  
* path of origin (gridion):
```bash
/data/231205_Metagenomes_sediment_Kristina/KK_1903_N3/no_sample/20240319_1550_X1_FAX80973_b466842e/fastq_pass/ 
```

## run03

* ~100GB sequencing dataset using 05 barcodes (one for each experiment)  
* path of origin (gridion):
```bash
/data/2024-05-03-Sediment-Promethion/2024-05-03-Sediment-Promethion/20240503_1728_P2S-01248-A_PAQ61173_ffaf27f4/fastq_pass
```

| Barcode | Sample Description |
|---------|--------------------|
| **01** | DNA extracted from a vacuum-centrifuged sediment sample (VCS4). |
| **02** | The same vacuum-centrifuged sample (VCS4) with 1% *Pseudomonas protegens* DTU 9.1. |
| **03** | Size-selected DNA from VCS4. |
| **04** | Size-selected DNA from VCS4 with 1% *Pseudomonas protegens* DTU 9.1. |
| **05** | DNA extracted from a vacuum-centrifuged sediment sample using a different bead-beating method (VTLS). |

## run03-rerun

* Workflow rerun of run03 with the same dataset and barcode structure.

| Barcode | Sample Description |
|---------|--------------------|
| **01** | DNA extracted from a vacuum-centrifuged sediment sample (VCS4). |
| **02** | The same vacuum-centrifuged sample (VCS4) with 1% *Pseudomonas protegens* DTU 9.1. |
| **03** | Size-selected DNA from VCS4. |
| **04** | Size-selected DNA from VCS4 with 1% *Pseudomonas protegens* DTU 9.1. |
| **05** | DNA extracted from a vacuum-centrifuged sediment sample using a different bead-beating method (VTLS). |
