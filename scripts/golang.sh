#!/usr/bin/env bash

printf "[golang] Setting up Go\n"

if [[ "x${DISTRIB_ID}" == "xUbuntu" ]] ; then
    sudo apt install -y golang
fi

printf "[golang] done\n"