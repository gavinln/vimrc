#!/usr/bin/env python3

"""
This file can be used to display all indented lines in a vim otl file
"""

import argparse
import sys
import re
from pathlib import Path
from collections import deque


def check_file_exists(filename):
    if not Path(filename).exists():
        sys.exit("File {} does not exist".format(filename))
    if not Path(filename).is_file():
        sys.exit("File {} is not a file".format(filename))


def get_indent_level(line):
    pattern = re.compile('^\t+')
    match = pattern.match(line)
    if match:
        start, end = match.regs[0]
        indent_level = end - start
    else:
        indent_level = 0
    return indent_level


def print_level_line(line):
    print(line, end='')
    # following used for debugging
    # indent_level = get_indent_level(line)
    # print('{}  {}'.format(indent_level, line), end='')


def is_nested(new_line, old_line):
    new_line_indent = get_indent_level(new_line)
    old_line_indent = get_indent_level(old_line)
    return new_line_indent > old_line_indent


def main():
    parser = argparse.ArgumentParser(
        description="get matching line and all subsequent indented lines")
    parser.add_argument("indented_file", help="name of text file with indented lines")
    parser.add_argument("match", help="string to find")
    args = parser.parse_args()
    check_file_exists(args.indented_file)
    match = args.match
    with Path(args.indented_file).open() as f:
        last_match_line = None
        for line in f.readlines():
            if last_match_line is None:
                if match in line:
                    last_match_line = line
                    print_level_line(line)
            else:
                if is_nested(line, last_match_line):
                    print_level_line(line)
                elif match in line:
                    print_level_line(line)
                    last_match_line = line
                else:
                    last_match_line = None


if __name__ == "__main__":
    main()
