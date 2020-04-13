#! /usr/bin/env python3

import argparse
import csv
import datetime
import pandas
import re


def get_date(s):
    re_date = re.compile(r".*As of (.*?)<")
    m = re_date.match(s)
    assert m is not None, "Parsing date failed"
    dstr = m.group(1)
    print(dstr)
    date = datetime.datetime.strptime(dstr, '%B %d, %Y').date()
    return date


def clean_tsv(s):
    # footnotes
    s = re.sub(r'\*+', "", s, flags=re.MULTILINE)
    # fake floats
    s = re.sub(r'\.0\t', "\t", s, flags=re.MULTILINE)
    s = re.sub(r'\.0$', "", s, flags=re.MULTILINE)
    return s


def process_tables(f):
    html = " ".join([x.strip() for x in f])
    date = get_date(html)
    print(date)
    dfs = pandas.read_html(html)
    for i, df in enumerate(dfs, 1):
        print(f"Processing {date} - Table {i}")
        unnamed = df.columns.str.contains('^Unnamed')
        unnamed_exists = True in unnamed
        print_header = not unnamed_exists
        fn = f"{date}.table{i}.tsv"
        s = df.to_csv(None,
                      quoting=csv.QUOTE_NONE,
                      sep='\t',
                      header=print_header,
                      index=False)
        s = clean_tsv(s)
        with open(fn, "w+") as f:
            f.write(s)


def main():
    parser = argparse.ArgumentParser(description="")

    parser.add_argument(
        'file',
        type=argparse.FileType('r'),
        metavar='str',
        help='input html file',
    )

    args = parser.parse_args()

    process_tables(args.file)


if __name__ == "__main__":
    main()
