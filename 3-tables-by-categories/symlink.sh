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

#rename 's/table\d+\.//g' *.tsv
)
