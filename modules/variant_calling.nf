process VARIANT_CALLING {
    publishDir "${params.output}/variants", mode: 'copy'

    input:
    path aligned_sam  // SAM file from BWA_ALIGN

    output:
    path "${aligned_sam.baseName}.vcf"

    script:
    """
    ${params.bcftools_bin} mpileup -Ou -f ${params.reference} ${aligned_sam} | \
        ${params.bcftools_bin} call -vmO v -o ${aligned_sam.baseName}.vcf
    """
}
