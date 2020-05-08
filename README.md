# Plague Phylogeography
A **VERY** in-development work on the phylogeography of *Yersinia pestis*.

## Dependencies
**Workflow:** NextFlow  
**Database:** NCBImeta, sqlite3 (CLI)  
**Alignment:** snippy  
**Masking, etc.:** dustmasker, mummer, vcftools   
**Phylogenetics:** iqtree  
**Statistics:** qualimap, multiqc

### Conda Environment
Create a conda environment with the required dependencies  
```
conda env create -f phylo-env.yaml --name phylo-env
conda activate phylo-env
```

### Dev Dependencies for Docs
```
pip install sphinx sphinx-rtd-theme m2r
```

Everything from here on out is free form notes as I experiment and document.

## Step By Step (From Scratch)

### Build NCBImeta database
```
nextflow run pipeline.nf \
  --ncbimeta_create ncbimeta.yaml \
  --skip_ncbimeta_db_update \
  --skip_sqlite_import \
  --skip_assembly_download \
  --skip_reference_download \
  --skip_reference_detect_repeats \
  --skip_reference_detect_low_complexity \
  --skip_snippy_pairwise \
  --skip_snippy_variant_summary \
  --skip_snippy_detect_snp_high_density \
  --skip_snippy_merge_mask_bed \
  --skip_snippy_multi \
  --skip_snippy_multi_filter \
  --skip_iqtree \
  --skip_qualimap_snippy_pairwise \
  --skip_multiqc \
  --outdir testSkip
```

```
nextflow run pipeline.nf \
  --ncbimeta_create ncbimeta.yaml \
  --skip_ncbimeta_db_update \
  --skip_reference_download \
  --outdir testSkip
```



### Annotate the Database
Query the Database for problematic records (wrong organism)
```
DB=results/ncbimeta_db/update/latest/output/database/yersinia_pestis_db.sqlite
sqlite3 $DB
.output annot_biosample.txt
SELECT BioSampleAccession,
       BioSampleBioProjectAccession,
       BioSampleStrain,
       BioSampleOrganism,
       BioSampleSRAAccession,
       BioSampleAccessionSecondary,
       BioSampleCollectionDate,
       BioSampleGeographicLocation,
       BioSampleHost,
       BioSampleComment
FROM BioSample
WHERE (BioSampleOrganism NOT LIKE '%Yersinia pestis%');
```
Add delimited headers to top of file (that match NCBImeta table BioSample)
```
DELIM="|";
sed  -i "1i BioSampleAccession${DELIM}BioSampleBioProjectAccession${DELIM}BioSampleStrain${DELIM}BioSampleOrganism${DELIM}BioSampleSRAAccession${DELIM}BioSampleAccessionSecondary${DELIM}BioSampleCollectionDate${DELIM}BioSampleGeographicLocation${DELIM}BioSampleHost${DELIM}BioSampleComment" annot_biosample.txt;
```
Convert from pipe-separated to tab-separated file
```
sed -i "s/|/\t/g" annot_biosample.txt
```
Inspect the annot_biosample.txt file in a spreadsheet view (ex. Excel, Google Sheets)  
Add "REMOVE: Not Yersinia pestis" to the BioSampleComment column to any rows that are confirmed appropriate.  


### Update Database With Annotations
```
nextflow run pipeline.nf \
  --ncbimeta_update ncbimeta.yaml \
  --ncbimeta_annot annot_biosample.txt \
  --max_datasets 2000 \
  -resume
```

### Run from established database
```
nextflow run pipeline.nf \
  --sqlite results/ncbimeta_db/update/latest/output/database/yersinia_pestis_db.sqlite \
  --max_datasets 200 \
  -resume
```
