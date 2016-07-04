#!/usr/bin/env bash

# find all source files
# count lines for each file
# sort from less to more lines
# remove the total line and the numbers of each line
# concat all files content including the title
# separate files
# open vim with the correct syntaxt

find ~/repository/ShellCheck/ -type f \
  | xargs wc -l \
  | sort -n \
  | sed "$ d; s|.......||" \
  | xargs tail -n +1 \
  | sed "s|==>|\n\n\n\n\n-- ==>|; s|<==|<==\n|" \
  | vim -c 'set syntax=haskell' -
