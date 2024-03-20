#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// include non-process modules
include { help_message; version_message; complete_message; error_message; pipeline_start_message } from './modules/messages.nf'
include { default_params; check_params } from './modules/params_parser.nf'
include { help_or_version } from './modules/params_utilities.nf'

version = '1.0dev'

// setup default params
default_params = default_params()
// merge defaults with user params
merged_params = default_params + params

// help and version messages
help_or_version(merged_params, version)
final_params = check_params(merged_params)
// starting pipeline
pipeline_start_message(version, final_params)


// include processes
include { SKA_FASTQ; SKA_ALIGN; SKA_MERGE; SKA_DISTANCE } from './modules/processes.nf' addParams(final_params)


workflow  {

          fastq_ch = channel
                                .fromPath( final_params.fastqs, checkIfExists: true )
                                .map { file -> tuple(file.simpleName, file) }
                                .ifEmpty { error "Cannot find any fastq file matching: ${final_params.fastqs}" }
				
	 
	 SKA_FASTQ(fastq_ch)
	 
	 collected_ska_fastq_ch = SKA_FASTQ.out.skf_ch.collect( sort: {a, b -> a[0].getBaseName() <=> b[0].getBaseName()} )
	 
	 SKA_ALIGN(collected_ska_fastq_ch)
	 
	 SKA_MERGE(collected_ska_fastq_ch)
	 
	 SKA_DISTANCE(SKA_MERGE.out.merged_ch)
				
         
}

workflow.onComplete {
    complete_message(final_params, workflow, version)
}

workflow.onError {
    error_message(workflow)
}
