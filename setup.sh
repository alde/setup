#!/usr/bin/env bash

source /etc/*-release

printf "Running setup for ${DISTRIB_ID}\n"

source scripts/wsl.sh
source scripts/oh_my_bash.sh
source scripts/git.sh
source scripts/mosh.sh
source scripts/golang.sh
source scripts/vim.sh
source scripts/tmux.sh
source scripts/urxvt.sh
