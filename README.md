# seabed-symphony: metagenomics pipeline for BGCs identification
[![Status](https://img.shields.io/badge/status-active-success.svg)]() [![Documentation](https://img.shields.io/badge/docs-available-brightgreen.svg)](documentation/documentation.pdf) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## 🌊 Overview
**seabed-symphony** is a metagenomics pipeline designed for **Biosynthetic Gene Clusters (BGCs) identification** from marine sediment microbiome sequencing data using long-reads. This workflow processes raw sequencing reads, performs quality control, assembles metagenomes (MAGs), classifies bacterial genomes taxonomically, annotates their functions, and detects BGCs using state-of-the-art tools.

<img src="https://github.com/felipevzps/seabed-symphony/blob/main/images/seabed-symphony.png" width="900">

## 📜 Features
✅ Barcode demultiplexing for multiplexed sequencing data  
✅ Metagenome-Assembled Genomes (MAGs) reconstruction  
✅ Genome filtering to keep only prokaryotic contigs for accurate gene prediction  
✅ High-quality genome binning and taxonomic classification  
✅ Identification and visualization of Biosynthetic Gene Clusters (BGCs)  
✅ Compatible with HPC environments  

## 📂 Pipeline Structure
The pipeline follows a **stepwise approach** to process raw sequencing data:

<img src="https://github.com/felipevzps/seabed-symphony/blob/main/images/workflow.png" width="900">

### 🏁 **Preprocessing & Quality Control**
- `0_rawReads` → Raw sequencing reads
- `1_rawReadsQC` → Quality control of raw reads ([NanoPlot](https://github.com/wdecoster/NanoPlot) & [SeqKit](https://github.com/shenwei356/seqkit))
- `2_trimmedReads` → Read trimming ([Filtlong](https://github.com/rrwick/Filtlong))
- `3_adapterRemoval` → Adapter removal ([Porechop](https://github.com/rrwick/Porechop))
- `4_trimmedReadsQC` → Post-trimming QC ([NanoPlot](https://github.com/wdecoster/NanoPlot) & [SeqKit](https://github.com/shenwei356/seqkit))

### 🧬 **Metagenome Assembly & Annotation**
- `5_metagenomeAssembly` → Metagenome assembly ([metaFlye](https://github.com/mikolmogorov/Flye))
- `6_bandage` → Assembly visualization ([Bandage](https://github.com/rrwick/Bandage))
- `7_assignTaxonomy` → Taxonomic classification ([Whokaryote](https://github.com/LottePronk/whokaryote))
- `8_prokaryoteContigs` → Filtering prokaryotic contigs ([extractContigsFromWhokaryote](https://github.com/felipevzps/seabed-symphony/blob/main/playground/8_prokaryote_contigs/extractContigsFromWhokaryote.py))

### 🏗 **Genome Binning & Quality Assessment**
- `9_genomeBinning` → Genome binning ([MetaBAT2](https://bioconda.github.io/recipes/metabat2/README.html) & [MaxBin2](https://anaconda.org/bioconda/maxbin2) & [CONCOCT](https://github.com/BinPro/CONCOCT) & [GraphMB](https://github.com/MicrobialDarkMatter/GraphMB))
- `10_nonRedundantBins` → Non-redundant genome bins ([DAS Tool](https://github.com/cmks/DAS_Tool))
- `11_CheckM` → Genome bin quality assessment ([CheckM](https://github.com/Ecogenomics/CheckM)]

### 🧪 **BGC Detection & Functional Analysis**
- `12_GTDB-Tk` → Phylogenetic classification ([GTDB-Tk](https://github.com/Ecogenomics/GTDBTk))
- `13_bakta` → Functional annotation ([Bakta](https://github.com/oschwengers/bakta))
- `14_BGCs` → Biosynthetic Gene Clusters detection ([antiSMASH](https://github.com/antismash/antismash))
- `15_BiG-SCAPE` → BGC classification and networking ([BiG-SCAPE](https://github.com/medema-group/BiG-SCAPE))

## 📖 Documentation
A step-by-step tutorial is available in [`documentation/documentation.pdf`](documentation/documentation.pdf), providing guidance on installation, usage, and best practices.

## 📬 Contact
For questions, feel free to open an [issue](https://github.com/felipevzps/seabed-symphony/issues).
