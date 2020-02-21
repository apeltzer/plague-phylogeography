# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project "attempts" to adhere to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Development]
- Rewrite shell scripts in python?

## [v0.1.0] - 2020-02-07

### Added
- Repository: README.md, CHANGELOG.md, .gitignore
- Data Collection: ncbimeta.yaml
- NextFlow: pipeline.nf, nextflow.config, phylo-env.yaml
- Misc: scripts/intervals2bed.sh
- Steps: NCBImeta, SQLite import, Reference Download, Assembly Download, Snippy Pairwise, Variants Summary

### Changed
- 2020-02-21 Used git filter-branch to purge ncbimeta.yaml from history. API key accidentally revealed. Re-added and now not tracked.

[Development]: https://github.com/ktmeaton/NCBImeta/compare/HEAD...dev
[v0.1.0]: https://github.com/ktmeaton/NCBImeta/compare/0447d630299ae11f7ffffb26280b1288e1c09c72...HEAD