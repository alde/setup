#!/usr/bin/env bash

xdefaultsConf="${HOME}/.Xdefaults"
install rxvt-unicode

if [ -d "${xdefaultsConf}" ] ; then
    printf "[urxvt] Already configured - skipping\n"
else
    printf "[urxvt] Setting up XDefaults for urxvt\n"
    cat ../conf/Xdefaults > ${xdefaultsConf}
fi
