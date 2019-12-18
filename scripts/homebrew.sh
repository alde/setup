#!/usr/bin/env bash

if [ -f $(which brew) ] ; then
  notice "[homebrew] already installed - skipping"
else
  info "[homebrew] Setting up homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  info "[homebrew] done"
fi
