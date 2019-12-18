#!/usr/bin/env bash

if [ -f $(which mosh) ]; then
  notice "[mosh] already installed - skipping"
else
  info "[mosh] Setting up mosh"
  install mosh
  info "[mosh] done"
fi
