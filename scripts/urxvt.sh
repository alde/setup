#!/usr/bin/env bash

xdefaultsConf="${HOME}/.Xdefaults"

if [[ $(uname) == "Linux" ]] ; then
    sudo apt install -y rxvt-unicode
    if [ -d "${xdefaultsConf}" ] ; then
        printf "[urxvt] Already configured - skipping\n"
    else
        printf "[urxvt] Setting up XDefaults for urxvt\n"
        cat ../conf/XDefaults > ${xdefaultsConf}
    fi
else
    printf "[urxvt] Not running linux"