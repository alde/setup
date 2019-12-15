#!/usr/bin/env bash

if [ -d "${HOME}/.oh-my-bash" ] ; then
    printf "[Oh My Bash] Already configured - skipping\n"
else
    printf "[Oh My Bash] Setting up Oh My Bash\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi