#!/usr/bin/env bash

info "[${DISTRIB_ID}] Running setup for ${DISTRIB_ID}"
install() {
    sudo apt install -y $*
}
