#!/usr/bin/env bash

printf "[${DISTRIB_ID}] Running setup for ${DISTRIB_ID}\n"
install() {
    sudo apt install -y $*
}