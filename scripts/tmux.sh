#!/usr/bin/env bash

tmuxConf="${HOME}/.tmux.conf"

if [ -f $(which tmux) ]; then
    notice "[tmux] Already installed - skipping"
else
    info "[tmux] Setting up tmux"
    install tmux
fi

if [ -f "${tmuxConf}" ] ; then
    notice "[tmux] Already configured - skipping"
else
    notice "[tmux] Configuring tmux"
    cat ${workdir}/conf/tmux.conf > ${tmuxConf}
fi

info "[tmux] done"
