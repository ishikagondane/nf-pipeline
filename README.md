# NF-Pipeline

A Nextflow-based bioinformatics pipeline for quality control, trimming, alignment, and variant calling of FASTQ sequencing files.

## Description

This pipeline is designed for processing next-generation sequencing (NGS) data. It automates the complete analysis workflow from raw sequencing reads to variant discovery.
The pipeline performs the following sequential steps:
1. **FASTQC**: Analyzes raw reads for quality metrics and generates HTML reports.
2. **CUTADAPT**: Removes adapter sequences and low-quality bases from reads.
3. **BWA-MEM**: Maps trimmed reads to a reference genome and produces SAM files.
4. **BCFtools**: Identifies genetic variants (SNPs/indels) and generates VCF files.

## Prerequisites

- [Nextflow](https://www.nextflow.io/)
- [Conda](https://docs.conda.io/) for environment management
- Tools: FastQC, CUTADAPT, BWA, BCFtools, Samtools

## Installation

```bash
# Clone the repository
git clone https://github.com/ishikagondane/nf-pipeline
cd nf-pipeline

# Create Conda environment
conda env create -f environment.yml

# Activate the environment
conda activate bioinfo
```

## Configuration

Edit nextflow.config to set:

**Input/Output

- fastq_dir: Path to the directory containing input FASTQ files
- output: Path to the output directory for results

**Tool Binaries

- fastqc_bin: Path to FastQC executable
- cutadapt_bin: Path to CUTADAPT executable
- bwa_bin: Path to BWA executable
- bcftools_bin: Path to BCFtools executable

**Analysis Parameters

- reference: Path to reference genome FASTA file
- adapter: Adapter sequence for trimming (e.g., "AGATCGGAAGAG")


## Usage

- Run the pipeline with:

```bash
nextflow run main.nf
```
- To resume a previous run:

```bash
nextflow run main.nf -resume
```

## Pipeline Flow
Raw FASTQ Files
       ↓
   FASTQC (Quality Control)
       ↓
  CUTADAPT (Adapter Trimming)
       ↓
 BWA_ALIGN (Read Alignment)
       ↓
VARIANT_CALLING (SNP Detection)

## Output

- ${output}/fastqc: FastQC reports
- ${output}/trimmed_reads: Trimmed FASTQ files
- ${output}/aligned: Aligned SAM files
- ${output}/variants: VCF files with detected variants

## Modules

- `FASTQC`: Performs quality control analysis on FASTQ files
- `CUTADAPT`: Trimming module 
- `BWA_A`:  long-read alignment module
- `VARIANT_C`: Genetic variants identifier

## Repository Structure
nf-pipeline/
├── main.nf                  # Entry point
├── nextflow.config          # Configuration file
├── bioinfo.yml              # Conda environment specification
├── README.md                # This file
├── .gitignore               # Git ignore rules
├── workflows/
│   └── workflow.nf          # Main workflow definition
└── modules/
    ├── fastqc.nf            # FASTQC module
    ├── cutadapt.nf         # CUTADAPT module
    ├── alignment.nf        # BWA alignment module
    └── variant_calling.nf  # BCFtools variant calling module
