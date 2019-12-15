#!/usr/bin/env bash

printf "[mosh] Setting up mosh\n"

if [[ "x${DISTRIB_ID}" == "xUbuntu" ]] ; then
    sudo apt install -y mosh
fi

printf "[mosh] done\n"