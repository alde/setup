#!/usr/bin/env bash

if [ -f /etc/os-release ] ; then
    source /etc/os-release
fi

workdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${workdir}/b3bp.sh

isDarwin=0
isWSL=0
DISTRIB_ID=""

if [[ "x${DISTRIB_ID}" == "xUbuntu" ]] ; then
    source ${workdir}/installer/ubuntu.sh
elif [[ $(uname) =~ "Darwin" ]] ; then
    isDarwin=1
    source ${workdir}/installer/macos.sh
else
    error "Unsupported distribution ${DISTRIB_ID}"
    exit 2
fi

if [[ $(uname -r) =~ "Microsoft" ]] ; then
    info "[WSL] Running in Windows Subsystem for Linux\n"
    isWSL=1
    source ${workdir}/scripts/wsl.sh
fi

source ${workdir}/scripts/rvm.sh

if [[ "x${isDarwin}" == "x1" ]] ; then
    source ${workdir}/scripts/homebrew.sh
fi

if [[ "x${isDarwin}" == "x0" && "x${isWSL}" == "x0" ]] ; then
    source ${workdir}/scripts/urxvt.sh
fi

source ${workdir}/scripts/oh_my_bash.sh
source ${workdir}/scripts/git.sh
source ${workdir}/scripts/mosh.sh
source ${workdir}/scripts/golang.sh
source ${workdir}/scripts/vim.sh
source ${workdir}/scripts/tmux.sh
