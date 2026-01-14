// This module will throw an error. Rectify it.
process CUTADAPT {
    publishDir "alignment_metrics", mode: 'copy'

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