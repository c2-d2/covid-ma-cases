#! /usr/bin/env bash

set -e
set -o pipefail
set -u

rm -f */*.tsv

(
mkdir -p 1_cases
cd 1_cases
grep -n 'Berkshire' ../../2-*/*.tsv \
	| grep -Evi '(male|female)' \
	| perl -pe 's/:.*//g' \
	| sort \
	| uniq \
	| xargs -L1 ln -s

rename 's/table\d+\.//g' *.tsv
)

(
mkdir -p 2_ethnicity
cd 2_ethnicity
grep -n 'Hispanic' ../../2-*/*.tsv \
	| perl -pe 's/:.*//g' \
	| sort \
	| uniq \
	| xargs -L1 ln -s

rename 's/table\d+\.//g' *.tsv
)

(
mkdir -p 3_deaths
cd 3_deaths
grep -n 'Preexisting' ../../2-*/*.tsv \
	| perl -pe 's/:.*//g' \
	| sort \
	| uniq \
	| xargs -L1 ln -s

rename 's/table\d+\.//g' *.tsv
)

(
mkdir -p 4_laboratories
cd 4_laboratories
grep -n 'Laboratory' ../../2-*/*.tsv \
	| perl -pe 's/:.*//g' \
	| sort \
	| uniq \
	| xargs -L1 ln -s

ls *.tsv \
	| sort \
	| grep -B 9999 2020-03-22 \
	| sort \
	| uniq \
	| xargs rm


# This is a non-sense table hidden somewhere in the document
rm 2020-03-31.table3.tsv

rename 's/table\d+\.//g' *.tsv
)
