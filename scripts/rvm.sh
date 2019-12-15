#!/usr/bin/env bash

rvmDir="${HOME}/.rvm"

if [ -d ${rvmDir} ] ; then
    printf "[rvm] already installed - skipping\n"
else
    gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable
    source "${HOME}/.rvm/scripts/rvm"
    rvm install 2.5
fi