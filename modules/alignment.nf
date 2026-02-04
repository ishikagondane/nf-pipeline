process BWA_ALIGN {
    publishDir "${params.output}/aligned", mode: 'copy'

    input:
    path trimmed_reads  // From CUTADAPT output

    output:
    path "${trimmed_reads.baseName}.sam"  // Or BAM if converting

    script:
    """
    ${params.bwa_bin} mem ${params.reference} ${trimmed_reads} > ${trimmed_reads.baseName}.sam
    """
}
