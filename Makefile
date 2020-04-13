.PHONY: all help clean symlink

SHELL=/usr/bin/env bash -eo pipefail

.SECONDARY:

.SUFFIXES:

SUBDIRS=$(shell ls -d *-*/)

all:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
	done
	$(MAKE) symlink

symlink:
	rm -f *.tsv
	lastdate=$$(ls 2-*/*.tsv | perl -pe 's/\..*//g' | sort | tail -n1);\
		for x in $${lastdate}.*; do\
			ln -s $$x;\
		done

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done
	rm -f *.tsv

