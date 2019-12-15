#!/usr/bin/env bash

printf "[tmux] Setting up tmux\n"
tmuxConf="${HOME}/.tmux.conf"

if [[ "x${DISTRIB_ID}" == "xUbuntu" ]] ; then
    sudo apt install -y tmux
fi

if [ -f "${tmuxConf}" ] ; then
    printf "[tmux] Already configured - skipping\n"
else
    printf "[tmux] Configuring tmux\n"
    cat ../conf/tmux.conf > ${tmuxConf}
fi

printf "[tmux] done\n"