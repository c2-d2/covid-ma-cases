.PHONY: all help clean

SHELL=/usr/bin/env bash -eo pipefail

.SECONDARY:

.SUFFIXES:

all:
	# manually addded docx that are not linked from the main MA website

	# last report
	curl https://www.mass.gov/info-details/covid-19-cases-quarantine-and-monitoring \
		| grep -oi "|.*doc.*" \
		| grep cases \
		| grep -o '".*"' \
		| perl -pe 's@"/@"https://www.mass.gov/@g'\
		| xargs -L0 wget --continue --content-disposition

	# reports from the archive
	curl https://www.mass.gov/info-details/archive-of-covid-19-cases-in-massachusetts \
		| grep -oi "|.*doc.*" \
		| grep -o '".*"' \
		| grep -v "return" \
		| grep -v "\.pdf" \
		| perl -pe 's@"/@"https://www.mass.gov/@g' \
		| xargs -L0 wget --continue --content-disposition

	# report from March 13 is missing from the list
	wget --continue --content-disposition https://www.mass.gov/doc/covid-19-cases-in-massachusetts-as-of-march-13-2020-accessible/download


help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean
	rm -f *.docx

