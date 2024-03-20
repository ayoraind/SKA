## Workflow to call MLST from assemblies.
### Usage

```

===============================================
 TAPIR MLST Pipeline version 1.0dev
===============================================

 Mandatory arguments:
         --assemblies                   Assembly file(s) you wish to supply as input (e.g., "/MIGE/01_DATA/03_ASSEMBLY/T055-8-G230101_FLYE/*.fasta")
         --output_dir                   Output directory to place final combined MLST output (e.g., "/MIGE/01_DATA/03_ASSEMBLY")
         --sequencing_date              Sequencing Date (for TAPIR, must start with G e.g., "G230223")

        Optional arguments:
         --scheme                       For forcing a specific mlst scheme (Default: False). If true, simply supply --scheme as part of the arguments
         --mlst_species                 Used only if the optional argument --scheme is used to force a particular mlst scheme. This must be one of
                                                abaumannii
                                                ranatipestifer
                                                mcatarrhalis
                                                aphagocytophilum
                                                afumigatus
                                                slugdunensis
                                                mmassiliense
                                                cbotulinum
                                                bordetella
                                                efaecium
                                                mhyopneumoniae
                                                otsutsugamushi
                                                mhaemolytica
                                                senterica
                                                bbacilliformis
                                                plarvae
                                                koxytoca
                                                chlamydiales
                                                streptomyces
                                                msynoviae
                                                cglabrata
                                                sepidermidis
                                                pmultocida_rirdc
                                                bcereus
                                                soralis
                                                sgallolyticus
                                                kkingae
                                                efaecalis
                                                hparasuis
                                                csepticum
                                                mabscessus
                                                tvaginalis
                                                shominis
                                                orhinotracheale
                                                yruckeri
                                                bhampsonii
                                                shaemolyticus
                                                sinorhizobium
                                                saureus
                                                bpilosicoli
                                                sthermophilus
                                                leptospira_2
                                                kseptempunctata
                                                xfastidiosa
                                                sbsec
                                                ctropicalis
                                                kaerogenes
                                                lmonocytogenes
                                                vibrio
                                                clari
                                                ssuis
                                                miowae
                                                csinensis
                                                ecoli
                                                leptospira_3
                                                ecoli_2
                                                bhenselae
                                                cfetus
                                                cfreundii
                                                spneumoniae
                                                mhyorhinis
                                                legionella_sbt
                                                leptospira
                                                hinfluenzae
                                                chyointestinalis
                                                magalactiae
                                                calbicans
                                                bintermedia
                                                cdiphtheriae
                                                smaltophilia
                                                szooepidemicus
                                                bcc
                                                campylobacter
                                                cupsaliensis
                                                bhyodysenteriae
                                                hpylori
                                                cconcisus
                                                sagalactiae
                                                pgingivalis
                                                bpseudomallei
                                                chelveticus
                                                tenacibaculum
                                                scanis
                                                csputorum
                                                mplutonius
                                                pacnes
                                                hsuis
                                                kpneumoniae
                                                pdamselae
                                                brachyspira
                                                yersinia
                                                wolbachia
                                                cinsulaenigrae
                                                mpneumoniae
                                                arcobacter
                                                vtapetis
                                                taylorella
                                                vvulnificus
                                                sdysgalactiae
                                                abaumannii_2
                                                blicheniformis
                                                sthermophilus_2
                                                edwardsiella
                                                mcaseolyticus
                                                fpsychrophilum
                                                dnodosus
                                                mcanis
                                                cdifficile
                                                mbovis
                                                pmultocida_multihost
                                                brucella
                                                spyogenes
                                                paeruginosa
                                                spseudintermedius
                                                cmaltaromaticum
                                                vparahaemolyticus
                                                ppentosaceus
                                                lsalivarius
                                                vcholerae
                                                cronobacter
                                                pfluorescens
                                                aeromonas
                                                ecloacae
                                                ckrusei
                                                neisseria
                                                achromobacter
                                                borrelia
                                                abaumannii
                                                ypseudotuberculosis
                                                bsubtilis
                                                hcinaedi
                                                suberis
                                                clanienae
						
	Helpful arguments:
        	--help                         This usage statement.
         	--version                      Version statement


```


## Introduction
This pipeline predicts MLST from assemblies derived from pure cultures or metagenomic samples. This Nextflow pipeline uses Torsten Tsemann's [MLST tool](https://github.com/tseemann/mlst). Module adapted from nf-core [MLST module](https://github.com/nf-core/modules/blob/master/modules/nf-core/mlst/main.nf).


Inputs are fastqs specified using `--assemblies`. 


## Sample command
An example of a command to run this pipeline is:

```
nextflow run main.nf --assemblies "assembly/Sample_file.fasta" --output_dir "test_out" --sequencing_date "G230202"

```

An example of a command to specify ('force') an Escherichia coli scheme is:

```
nextflow run main.nf --assemblies "assembly/Sample_file.fasta" --output_dir "test_out" --sequencing_date "G230202" --scheme --mlst_species ecoli

```

## Word of Note
This is an ongoing project at the Microbial Genome Analysis Group, Institute for Infection Prevention and Hospital Epidemiology, Üniversitätsklinikum, Freiburg. The project is funded by BMBF, Germany, and is led by [Dr. Sandra Reuter](https://www.uniklinik-freiburg.de/institute-for-infection-prevention-and-control/microbial-genome-analysis.html).


## Authors and acknowledgment
The TAPIR (Track Acquisition of Pathogens In Real-time) team.

