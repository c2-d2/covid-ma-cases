# COVID-19 cases in Massachusetts

This repository contains scripts to pull and convert data from the official [COVID-19 cases in Massachusetts](https://www.mass.gov/info-details/archive-of-covid-19-cases-in-massachusetts) website. The resulting files are located in the [4-tables-by-categories](4-tables-by-categories/) directory.

## How to use

### Get the data

* Cloning using git: `git clone https://github.com/c2-d2/covid-ma-cases`
* Downloading as a zip: [link](https://github.com/c2-d2/covid-ma-cases/archive/master.zip)


### Execute the workflow

* Prerequisites: Mac OS, Python 3.6+ with Pandas, Pandoc, Wget, Curl, RSync
* Clean: `make clean`
* Redo everything: `make -j`

## Pipeline

1. All reports from the Massachusetts Department of Public Health are downloaded; these are provided in the form of DOCX documents on https://www.mass.gov/info-details/archive-of-covid-19-cases-in-massachusetts (1 report per 1 day).
2. The obtained documents are converted by Pandoc to HTML and Markdown.
3. The HTML files are parsed using Pandas and individual tables exported into separate TSV files.
4. Tables of individual categories are identified using text search and symlinked.
5. The symlinked files are copied to a new directory.

## Licence

[MIT](./LICENSE)


## Contact

[Karel Břinda](https://scholar.harvard.edu/brinda) \<karel.brinda@hms.harvard.edu\>
