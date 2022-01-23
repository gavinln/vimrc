#!/bin/bash

# Script helps run a Makefile from any sub-directory
# non-file arguments are passed to Makefile directly
# file arguments are converted to relative paths

set -Eeuo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MAKEFILE_DIR=$(realpath "$SCRIPT_DIR/..")

if [[ $# -eq 0 ]]; then
    make -C "$MAKEFILE_DIR"
elif [[ ! -e $1 ]]; then
    # not a path argument so pass it to Makefile
    make -C "$MAKEFILE_DIR" "$@"
else
    # convert paths to relative to Makefile dir
    REL_FILE=$(realpath --relative-to "$MAKEFILE_DIR" "$1") 
    make -B -C "$MAKEFILE_DIR" "$REL_FILE"
fi
