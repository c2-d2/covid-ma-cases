fns=$(notdir $(wildcard ../1-pandoc/*.html))
$(info $(fns))

.PHONY: all help clean cleanall $(fns)

SHELL=/usr/bin/env bash -eo pipefail

.SECONDARY:

.SUFFIXES:

all: $(fns)

$(fns):
	../scripts/ma_html_to_tsv.py ../1-pandoc/$@

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean

cleanall: clean ## Clean all

