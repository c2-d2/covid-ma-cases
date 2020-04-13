.PHONY: all help clean

SHELL=/usr/bin/env bash -eo pipefail

.SECONDARY:

.SUFFIXES:

all:
	# automatic links detection
	curl https://www.mass.gov/info-details/archive-of-covid-19-cases-in-massachusetts \
		| grep -oi "|.*doc.*" \
		| grep -o '".*"' \
		| grep -v "return" \
		| perl -pe 's@"/@"https://www.mass.gov/@g' \
		| xargs -L0 wget --continue --content-disposition

	# manually addded docx that are not linked from the main MA website
	wget --continue --content-disposition https://www.mass.gov/doc/covid-19-cases-in-massachusetts-as-of-april-12-2020-0/download


help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean
	rm -f *.docx

