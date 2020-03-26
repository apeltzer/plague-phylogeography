#!/usr/bin/env nextflow

/*
========================================================================================
                         Plague Pipeline
========================================================================================
 Plague Phylogeography Pipeline
 Create 2020-02-06
 #### Homepage / Documentation
 https://github.com/ktmeaton/paper-phylogeography
 #### Authors
 Katherine Eaton <ktmeaton@gmail.com> - https://github.com/ktmeaton>
========================================================================================

Notes and Nomenclatures
- All channel objects must use the 'ch_' prefix in variable naming
- Flags to skip a process must use the 'skip_' refix then the process name
- The process docstrings will only describe output channels, not other file types
- Verbosity for variable names is greatly preferred over succinctness.
*/

// -------------------------------------------------------------------------- //
//                               Program Header                               //
// -------------------------------------------------------------------------- //
def pipelineHeader() {
  return"""
  =========================================
  ${workflow.manifest.name} v${workflow.manifest.version}
  =========================================
  """.stripIndent()
}

// Quick/Minimal program name and version number
if (params.version){
    log.info"""
    ${workflow.manifest.name} v${workflow.manifest.version}
    """.stripIndent()
    exit 0
}


// -------------------------------------------------------------------------- //
//                               Help Message                                 //
// -------------------------------------------------------------------------- //

def helpMessage() {
    // Help message with parameter information and usage
    log.info pipelineHeader()
    log.info"""
    Usage:

    The typical command for executing the pipeline is:

    nextflow run ${workflow.manifest.mainScript}

    DATABASE (Choose 1 of the following):

    --ncbimeta_create      Path to yaml config file to create NCBImeta DB (ncbimeta.yaml).
    --ncbimeta_update      Path to yaml config file to update NCBImeta DB (ncbimeta.yaml).
    --ncbimeta_annot       Path to text annotation file for NCBImeta DB (annot.txt).
    --sqlite               Path to sqlite database file from NCBImeta (my_db.sqlite).


    DOWNLOAD:

    --max_datasets         Maximum number of datasets to download and analyze [100].


    OTHER:

    --help                 Print this help message.
    --version              Print the current version number.
    --outdir               The output directory where results are saved [results].

    """
}

// Show help message
if (params.help){
    helpMessage()
    exit 0
}


log.info pipelineHeader()

// -------------------------------------------------------------------------- //
//                           Reference Genome Processing                      //
// -------------------------------------------------------------------------- //

// ----------------------------------Download---------------------------------//

process reference_download{
  /*
   Download the reference genome of interest from the FTP site.

   Input:
   reference_genome_fna (fasta): The reference genome fasta accessed by url via FTP

   Output:
   ch_reference_genome_snippy_pairwise (fasta.gz): The compressed reference genome for snippy_pairwise process
   ch_reference_detect_repeats (fasta): The reference genome for detect_repeats process
   ch_reference_genome_detect_low_complexity (fasta): The reference genome for detect_low_complexity process

   Publish:
   reference_genome/${reference_genome_fna.baseName} (fasta): The reference genome
  */

  // Other variables and config
  tag "$reference_genome_fna"
  echo true
  publishDir "${params.outdir}/reference_genome", mode: 'copy'

  // IO and conditional behavior
  input:
  file reference_genome_fna from file(params.reference_genome_ftp)
  output:
  file "${reference_genome_fna.baseName}" into ch_reference_genome_snippy_pairwise, ch_reference_detect_repeats, ch_reference_genome_low_complexity
  when:
  !params.skip_reference_download

  // Shell script to execute
  script:
  """
  gunzip -f ${reference_genome_fna}
  """
}

// -----------------------------Detect Repeats--------------------------------//

process reference_detect_repeats{
  /*
   Detect in-exact repeats in reference genome using the program mummer.
   Convert the identified regions file to a bed format.

   Input:
   reference_genome_fna (fasta): The reference genome fasta from the process reference_download.

   Output:
   ch_bed_ref_detect_repeats (bed): A bed file containing regions of in-exact repeats.
  */
  // Other variables and config
  tag "$reference_genome_fna"
  publishDir "${params.outdir}/snippy_filtering", mode: 'copy'
  echo true

  // IO and conditional behavior
  input:
  file reference_genome_fna from ch_reference_detect_repeats
  output:
  file "${reference_genome_fna.baseName}.inexact.repeats.bed" into ch_bed_ref_detect_repeats
  file "${reference_genome_fna.baseName}.inexact*"
  when:
  !params.skip_reference_detect_repeats

  // Shell script to execute
  script:
  """
  PREFIX=${reference_genome_fna.baseName}
  # Align reference to itself to find inexact repeats
  nucmer --maxmatch --nosimplify --prefix=\${PREFIX}.inexact ${reference_genome_fna} ${reference_genome_fna}
  # Convert the delta file to a simplified, tab-delimited coordinate file
  show-coords -r -c -l -T \${PREFIX}.inexact.delta | tail -n+5 > \${PREFIX}.inexact.coords
  # Remove all "repeats" that are simply each reference aligned to itself
  # also retain only repeats with more than 90% sequence similarity.
  awk -F "\t" '{if (\$1 == \$3 && \$2 == \$4 && \$12 == \$13)
        {next;}
    else if (\$7 > 90)
        {print \$0}}' \${PREFIX}.inexact.coords > \${PREFIX}.inexact.repeats
  # Convert to bed file format, changing to 0-base position coordinates
  awk -F "\t" '{print \$12 "\t" \$1-1 "\t" \$2-1;
    if (\$3 > \$4){tmp=\$4; \$4=\$3; \$3=tmp;}
    print \$13 "\t" \$3-1 "\t" \$4-1;}' \${PREFIX}.inexact.repeats | \
  sort -k1,1 -k2,2n | \
  bedtools merge > \${PREFIX}.inexact.repeats.bed
  """

}

// -------------------------Detect Low Complexity-----------------------------//

process reference_detect_low_complexity{
  /*
   Detect low complexity regions with dustmasker.
   Convert the identified regions file to a bed format.

   Input:
   reference_genome_fna (fasta): The reference genome fasta from the process reference_download.

   Output:
   ch_bed_ref_low_complexity (bed): A bed file containing regions of low-complexity regions.
  */
  // Other variables and config
  tag "$reference_genome_fna"
  publishDir "${params.outdir}/snippy_filtering", mode: 'copy'
  echo true

  // IO and conditional behavior
  input:
  file reference_genome_fna from ch_reference_genome_low_complexity
  output:
  file "${reference_genome_fna.baseName}.dustmasker.intervals"
  file "${reference_genome_fna.baseName}.dustmasker.bed" into ch_bed_ref_low_complex
  when:
  !params.skip_reference_detect_low_complexity

  // Shell script to execute
  script:
  """
  dustmasker -in ${reference_genome_fna} -outfmt interval > ${reference_genome_fna.baseName}.dustmasker.intervals
  ${params.scriptdir}/intervals2bed.sh ${reference_genome_fna.baseName}.dustmasker.intervals ${reference_genome_fna.baseName}.dustmasker.bed
  """
}