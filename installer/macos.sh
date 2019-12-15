#!/usr/bin/env bash

printf "[MacOS] Running setup for MacOS\n"
install() {
    brew install $*
}
