.PHONY: all help clean

SHELL=/usr/bin/env bash -eo pipefail

.SECONDARY:

.SUFFIXES:

files_html=$(notdir $(patsubst %.docx,%.html, $(wildcard ../0-original-files/*.docx)))
files_md=$(notdir $(patsubst %.docx,%.md, $(wildcard ../0-original-files/*.docx)))

all: $(files_html) $(files_md)

%.html: ../0-original-files/%.docx
	pandoc -t html5 -s $< -o $@

%.md: ../0-original-files/%.docx
	pandoc -t gfm -s $< -o $@

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean
	rm -f *.md *.html

