include { FASTQC }   from '../modules/fastqc.nf'
include { CUTADAPT } from '../modules/cutadapt.nf'

workflow TRIM_AND_QC {

    channel
        .fromPath("${params.fastq_dir}/*.fastq.gz")
        .set { reads }

    FASTQC(reads)

    trimmed = CUTADAPT(reads)

    FASTQC(trimmed)
}