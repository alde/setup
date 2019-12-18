#!/usr/bin/env bash

xdefaultsConf="${HOME}/.Xdefaults"

if [ -f $(which urxvt) ] ; then
    notice "[urxvt] Already installed - skipping"
else
    info "[urxvt] Setting up urxvt"
    install rxvt-unicode
fi

if [ -d "${xdefaultsConf}" ] ; then
    notice "[urxvt] Already configured - skipping"
else
    notice "[urxvt] Setting up XDefaults for urxvt"
    cat ${workdir}/conf/Xdefaults > ${xdefaultsConf}
fi

info "[urxvt] done"
