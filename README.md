# NF-Pipeline

A Nextflow-based bioinformatics pipeline for quality control of FASTQ sequencing files using FastQC.

## Description

This pipeline processes FASTQ files from a specified directory, performs quality control analysis using FastQC, and publishes the results to an output directory. It is designed to be modular and extensible, with support for additional processing steps like trimming with Cutadapt (currently commented out).

## Prerequisites

- [Nextflow](https://www.nextflow.io/) installed
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) installed and accessible via the path specified in `nextflow.config`
- (Optional) [Cutadapt](https://cutadapt.readthedocs.io/en/stable/) for trimming (currently disabled)

## Installation

1. Clone or download this repository.
2. Ensure Nextflow is installed: `curl -s https://get.nextflow.io | bash`
3. Install FastQC and update the `fastqc_bin` path in `nextflow.config` if necessary.

## Configuration

Edit `nextflow.config` to set the following parameters:

- `fastq_dir`: Path to the directory containing input FASTQ files (e.g., `/path/to/fastq/files`)
- `output`: Path to the output directory for results (e.g., `/path/to/output`)
- `fastqc_bin`: Path to the FastQC executable (default: `/opt/homebrew/bin/fastqc`)
- `cutadapt_bin`: Path to the Cutadapt executable (for future use)

## Usage

Run the pipeline with:

```bash
nextflow run main.nf
```

The pipeline will:

1. Read all `.fastq.gz` files from the specified `fastq_dir`
2. Run FastQC on each file
3. Publish FastQC reports to `${output}/fastqc`

## Output

- FastQC HTML reports and zip files in the `fastqc` subdirectory of the output directory

## Modules

- `FASTQC`: Performs quality control analysis on FASTQ files
- `CUTADAPT`: Trimming module (currently commented out in the workflow)

## Extending the Pipeline

To enable trimming, uncomment the relevant lines in `workflows/workflow.nf` and ensure Cutadapt is installed.
