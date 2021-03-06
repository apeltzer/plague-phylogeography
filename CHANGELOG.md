# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project "attempts" to adhere to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Development]

- Rewrite shell scripts in python?
- Lint all python scripts with black+flake8
- Deal with the fail to publish issue with NCBImeta db
- Add exact-repeats and tandem repeats detection
- Add GeoPy to phylo-env environment
- Github actions, to build docs and remote narratives
- Make the snippy multi filter locus splitting be generic (not plague specific)
- Deal with nextstrain augur not working with phylogeny with branch support values
- Breakup snippy step in pipeline to snippy - snp stats - snpeff
- Allow input of own contig files (param)
- Allow input of own fastq files (tsv concat)

## [v0.1.4] - 2020-06-18 - SRA and nf-core/eager

### Added

- sra_download and eager process
- outgroup_download and outgroup options for iqtree
- extra parameters for iqtree (RNG, bootstrapping, multiple runs)
- new workflow: install.yaml to test nextflow install method

### Changed

- Rename pipeline.nf to main.nf for nextflow pull compatibility
- Condense phylo-env environment files and rename to environment.yaml
- Moved config files to config/ directory
- workflow: pipeline.yaml now tests assembly pipeline, sra download and eager
- rename environment phylo-env to plague-phylogeography-0.1.4dev

## [v0.1.3] - 2020-05-28 - DHSI2020 Exhibit

Release for the [DHSI2020 Conference and Colloquium](https://dhsi.org/dhsi-2020/#colloquium) Exhibit.

## [v0.1.2] - 2020-05-13 - Github Actions and Linting

### Added

- scripts/sqlite_EAGER_tsv.py scripts/sqlite_NextStrain_tsv.py scripts/geocode_NextStrain.py
- pre-commit linting and misc
- workflows: pipeline, linting, docs
- Automate SNPEff db creation
- Split dependencies into user and dev conda env

### Changed

- git update-index --add --chmod=+x scripts/*
- IQTREE update to version 2
- All BioSampleComment columns filled in for database

## [v0.1.1] - 2020-04-29 - Narratives and ReadtheDocs

### Added

- ModelFinder for model selection, automatic integration with IQTREE
- scripts/fasta_split_locus.sh
- EAGER processing begins  (eager/)
- NextStrain Datasets and Narratives (auspice/ and narratives/)

### Removed

- Modeltest-NG process entirely removed

### Changed

- At this point, the pipeline is fully resumable.
- git update-index --add --chmod=+x scripts/fasta_split_replicon.sh

## [v0.1.0] - 2020-04-14

### Added

- Repository: README.md, CHANGELOG.md, .gitignore
- Configuration: ncbimeta.yaml, multiqc_config.yaml
- Annotation: annot_biosample.txt
- NextFlow: pipeline.nf, nextflow.config, phylo-env.yaml
- Documentation: docs directory for Sphinx Read The Docs template
- Paper: paper directory for Sphinx Read The Docs template
- Misc: scripts/intervals2bed.sh, scripts/fasta_unwrap.sh scripts/fasta_filterGapsNs.sh
- Steps - Database: NCBImeta Create, NCBImeta Update
- Steps - Data Download: SQLite import, Reference Download, Assembly Download
- Steps - Alignment: Snippy Pairwise, Variants Summary
- Steps - Filtering: Detect repeats, low-complexity, high-density SNPs
- Steps - Evolution: Modeltest, Maximum Likelihood Phylogeny
- Steps - Statistics: QualiMap, MultiQC

### Changed

- 2020-02-21 Used git filter-branch to purge ncbimeta.yaml from history. API key accidentally revealed. Re-added and now not tracked.
- 2020-02-28 Redo ncbimeta.yaml history purge:

  ```bash
  cp ncbimeta.yaml $HOME/ncbimeta.yaml.bak
  ```

  (Delete sensitive data)

  ```bash
  git filter-branch --force --index-filter "git rm --cached --ignore-unmatch ncbimeta.yaml" --prune-empty --tag-name-filter cat -- --all
  ```

  Push the changes to the remote

  ```bash
  git push origin --force --all
  ```

  (Restore default config file)

  ```bash
  mv $HOME/ncbimeta.yaml.bak ncbimeta.yaml
  git add -f ncbimeta.yaml
  ```

  Stop git from continuing to track the file and ignore

  ```bash
  git update-index --skip-worktree ncbimeta.yaml
  echo "ncbimeta.yaml" >> .gitignore
  ```

  After stash+pull, restore yaml with sensitive info

  ```bash
  git checkout stash@{0} -- ncbimeta.yaml
  ```

  If you need to restore the file to the work tree:

  ```bash
  git update-index --no-skip-worktree ncbimeta.yaml
  ```

[Development]: https://github.com/ktmeaton/paper-phylogeography/compare/HEAD...dev
[v0.1.4]: https://github.com/ktmeaton/paper-phylogeography/compare/v0.1.3...HEAD
[v0.1.3]: https://github.com/ktmeaton/paper-phylogeography/compare/v0.1.2...v0.1.3
[v0.1.2]: https://github.com/ktmeaton/paper-phylogeography/compare/v0.1.1...v0.1.2
[v0.1.1]: https://github.com/ktmeaton/paper-phylogeography/compare/v0.1.0...v0.1.1
[v0.1.0]: https://github.com/ktmeaton/paper-phylogeography/compare/de952505c2a4ebbfdd7a6747896e3e7372c8030b...v0.1.0

<!-- markdownlint-disable-file MD024 -->
