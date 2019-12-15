#!/usr/bin/env bash

source /etc/*-release

isDarwin=0
isWSL=0

if [[ "x${DISTRIB_ID}" == "xUbuntu" ]] ; then
    source ./installer/ubuntu.sh
elif [[ $(uname) =~ "Darwin" ]] ; then 
    isDarwin=1
    source ./installer/macos.sh
else
    printf "Unsupported distribution ${DISTRIB_ID}\n"
    exit 2
fi

if [[ $(uname -r) =~ "Microsoft" ]] ; then 
    printf "[WSL] Running in Windows Subsystem for Linux\n"
    isWSL=1
fi


if [[ "x${isWSL}" == "x1" ]] ; then
    source scripts/wsl.sh
fi

source scripts/rvm.sh

if [[ "x${isDarwin}" == "x1" ]] ; then
    source scripts/homebrew.sh
fi

if [[ "x${isDarwin}" == "x0" && "x${isWSL}" == "x0" ]] ; then
    source scripts/urxvt.sh
fi

source scripts/oh_my_bash.sh
source scripts/git.sh
source scripts/mosh.sh
source scripts/golang.sh
source scripts/vim.sh
source scripts/tmux.sh
