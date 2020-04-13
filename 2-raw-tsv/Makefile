fns=$(notdir $(wildcard ../1-pandoc-files/*.html))

.PHONY: all help clean cleanall $(fns)

SHELL=/usr/bin/env bash -eo pipefail

.SECONDARY:

.SUFFIXES:

all: $(fns)

$(fns):
	../scripts/ma_html_to_tsv.py ../1-pandoc-files/$@

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean

cleanall: clean ## Clean all

