include { FASTQC }   from '../modules/fastqc.nf'
include { CUTADAPT } from '../modules/cutadapt.nf'
include { BWA_ALIGN } from '../modules/alignment.nf'
include { VARIANT_CALLING } from '../modules/variant_calling.nf'

workflow TRIM_AND_QC {

    channel
        .fromPath("${params.fastq_dir}/*.fastq.gz")
        .set { reads }

    FASTQC(reads)

    trimmed = CUTADAPT(reads)

    aligned = BWA_ALIGN(trimmed)

    VARIANT_CALLING(aligned)
}
