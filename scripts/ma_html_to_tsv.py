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


def split_tables(f):
    html = " ".join([x.strip() for x in f])
    date = get_date(html)
    print(date)
    dfs = pandas.read_html(html)
    for i, df in enumerate(dfs, 1):
        print(f"Processing {date} - Table {i}")
        df.to_csv(f"{date}.table{i}.tsv",
                  quoting=csv.QUOTE_NONE,
                  sep='\t',
                  index=False)


def main():
    parser = argparse.ArgumentParser(description="")

    parser.add_argument(
        'file',
        type=argparse.FileType('r'),
        metavar='str',
        help='input html file',
    )

    args = parser.parse_args()

    split_tables(args.file)


if __name__ == "__main__":
    main()
