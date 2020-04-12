#!/usr/bin/env Rscript

library(htmltab)
library(optparse)

parser <-
    OptionParser(usage = "%prog inp_tab.html out_tab.tsv")

arguments <- parse_args(parser, positional_arguments = 2)
in.file <- arguments$args[1]
out.file <- arguments$args[2]

tbl <- htmltab(in.file)
write.table(tbl,
            out.file,
            quote = FALSE,
            sep = '\t',
            row.names = F)
