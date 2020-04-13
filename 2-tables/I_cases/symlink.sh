#! /usr/bin/env bash

set -e
set -o pipefail
set -u

rm -f *.tsv
grep -n 'Berkshire' ../*.tsv \
	| grep -Evi '(male|female)' \
	| perl -pe 's/:.*//g' \
	| sort \
	| uniq \
	| xargs -L1 ln -s
