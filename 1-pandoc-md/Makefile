.PHONY: all help clean cleanall

SHELL=/usr/bin/env bash -eo pipefail

.SECONDARY:

.SUFFIXES:

files=$(notdir $(patsubst %.docx,%.html, $(wildcard ../0-official-files/*.docx)))

$(info $(files))
all: $(files)
	#covid-19-case-report-03-22-2020-acc.html


%.html: ../0-official-files/%.docx
	pandoc $< > $@

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean

cleanall: clean ## Clean all
	rm -f *.html

