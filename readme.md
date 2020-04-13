# COVID-19 cases in Massachusetts

This repository contains scripts to pull and convert data from the official *COVID-19 cases in Massachusetts* website. The resulting files are located in the [4-tables-by-categories](4-tables-by-categories/) directory.

## How to use

* Prerequisites: Mac OS, Python with Pandas, Pandoc, Wget, RSync
* Redo everything: `make -j`
* Clean: `make clean`

## Pipeline

1. All reports from the Massachusetts Department of Public Health are downloaded; they are provided in the form of DOCX documents on https://www.mass.gov/info-details/archive-of-covid-19-cases-in-massachusetts (1 report per 1 day).
2. The obtained documents are converted by Pandoc to HTML and Markdown.
3. The HTML files are parsed using Pandas and individual tables exported into separate TSV files.
4. Tables of individual categories are identified using text search and symlinked.
5. The symlinked files are copied to a new directory.

## Author

[Karel Břinda](https://scholar.harvard.edu/brinda) \<karel.brinda@hms.harvard.edu\>
