.PHONY: all help clean cleanall

SHELL=/usr/bin/env bash -eo pipefail

.SECONDARY:

.SUFFIXES:

all:
	curl https://www.mass.gov/info-details/archive-of-covid-19-cases-in-massachusetts \
		| grep -oi "|.*doc.*" \
		| grep -o '".*"' \
		| grep -v "return" \
		| perl -pe 's@"/@"https://www.mass.gov/@g' \
		| xargs -L0 wget --continue --content-disposition

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean

cleanall: clean ## Clean all
	rm -f *.docx


