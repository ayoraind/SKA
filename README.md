## Workflow to Utilize SKA.
### Usage

```

===============================================
 TAPIR SKA Pipeline version 1.0dev
===============================================

 Mandatory arguments:
         --fastqs                       fastq file(s) you wish to supply as input (e.g., "/MIGE/01_DATA//*_1.fastq.gz")
         --output_dir                   Output directory (e.g., "/MIGE/01_DATA/SKA")
        
        						
	Helpful arguments:
        	--help                         This usage statement.
         	--version                      Version statement


```


## Introduction
This pipeline generates skf files, calculates SNP distances, and assigns strains to clusters based on the SNP distances. This Nextflow pipeline was adapted from [SKA](https://github.com/simonrharris/SKA).
 


## Sample command
An example of a command to run this pipeline is:

```
nextflow run main.nf --fastqs "assembly/Sample_file_1.fastq.gz" --output_dir "test_out"

```

## Word of Note
This is an ongoing project at the Microbial Genome Analysis Group, Institute for Infection Prevention and Hospital Epidemiology, Üniversitätsklinikum, Freiburg. The project is funded by BMBF, Germany, and is led by [Dr. Sandra Reuter](https://www.uniklinik-freiburg.de/institute-for-infection-prevention-and-control/microbial-genome-analysis.html).


## Authors and acknowledgment
The TAPIR (Track Acquisition of Pathogens In Real-time) team.

