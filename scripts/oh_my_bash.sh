#!/usr/bin/env bash

if [ -d "${HOME}/.oh-my-bash" ] ; then
    notice "[Oh My Bash] Already configured - skipping"
else
    info "[Oh My Bash] Setting up Oh My Bash"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    info "[Oh My Bash] done"
fi
