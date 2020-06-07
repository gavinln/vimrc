#!/bin/bash

# Usage: bash git-modified-files.sh | grep -v :0

# number of modified files in git projects

# find git project directories
# search hidden directories with max depth 2, fixed string .git
for git_dir in $(fd -H --type d -d 2 -F '.git')
do
    modified_files=$(git -C "$(dirname "$git_dir")" status -s | grep -c '^ M')
    echo "$(dirname "$git_dir") :${modified_files}"
done
