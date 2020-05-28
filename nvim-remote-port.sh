#!/bin/sh
set -eu

# start port forwarding
# ssh -L 7777:127.0.0.1:7777 gavin
PORT=7777

# to find program listening on port
# lsof -i :7777

export NVIM_LISTEN_ADDRESS=0.0.0.0:7777

# https://stackoverflow.com/questions/10408816/how-do-i-use-the-nohup-command-without-getting-nohup-out
nohup nvim --headless </dev/null >/dev/null 2>&1 &

# run nvim remotely
# nvim-qt --server localhost:7777
