#!/bin/sh
set -eu

# start port forwarding
# ssh -L 6846:127.0.0.1:6846 gavin
PORT=6846

# to find program listening on port
# lsof -i :6846

export NVIM_LISTEN_ADDRESS=0.0.0.0:6846

# https://stackoverflow.com/questions/10408816/how-do-i-use-the-nohup-command-without-getting-nohup-out
nohup nvim --headless </dev/null >/dev/null 2>&1 &

# run nvim remotely
# nvim-qt --server localhost:6846
