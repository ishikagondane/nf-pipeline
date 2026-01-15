
process CUTADAPT {
    publishDir "${params.output}/trimmed_reads", mode: 'copy'

    input:
    path file

    output:
    path "${file.baseName}.trimmed.fastq.gz"

    script:
    """
    cutadapt \
        -a ${params.adapter} \
        -o ${file.baseName}.trimmed.fastq.gz \
        $file
    """
}