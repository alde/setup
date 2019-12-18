#!/usr/bin/env bash

if [ -f $(which go) ] ; then
  notice "[golang] already installed - skipping"
else
  info "[golang] Setting up Go"
  install golang
  info "[golang] done"
fi
