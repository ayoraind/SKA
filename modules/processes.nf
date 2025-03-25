process SKA_FASTQ {
    tag "$meta"
    publishDir "${params.output_dir}", mode:'copy'

    input:
    tuple val(meta), path(fastq)

    output:
    path("*.skf"),                 emit: skf_ch
    path("*.log"),                 emit: log_ch
    path "versions.yml",           emit: versions_ch

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta}"
    """
    ska fasta \\
        $args \\
        -o $prefix \\
        $fastq \\
        > ${prefix}.log
    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        ska: \$( echo \$(ska --version 2>&1) | grep 'Version' | cut -d':' -f2 )
    END_VERSIONS
    """

}

process SKA_ALIGN {
    tag "$meta"
    publishDir "${params.output_dir}", mode:'copy'

    input:
    path(collected_ska)
    
    output:
    path("*.aln"),                 emit: aln_ch
    
    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    
    """
    ska align \\
        $args \\
        -v \\
	$collected_ska
    """

}


process SKA_MERGE {
    tag "$meta"
    publishDir "${params.output_dir}", mode:'copy'

    input:
    path(collected_ska)
    
    output:
    path("*.skf"),                 emit: merged_ch
    
    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    
    """
    ska merge \\
        $args \\
        $collected_ska
    """

}


process SKA_DISTANCE {
    tag "$meta"
    publishDir "${params.output_dir}", mode:'copy'

    input:
    path(merged_file)
    
    output:
    path("*"),                 emit: distance_ch
    
    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    
    """
    ska distance \\
        $args \\
        $merged_file
    """

}

