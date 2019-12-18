#!/usr/bin/env bash

vundle="${HOME}/.vim/bundle/Vundle.vim"
vimrc="${HOME}/.vimrc"
if [ -f $(which vim) ] ; then
    notice "[vim] Already installed - skipping"
else
    info "[vim] Setting up vim"
    install vim
fi

if [ -d "${vundle}" ] ; then
    notice "[vim] vundle already installed - updating"
    (cd ${vundle} && git pull)
else
    notice "[vim] installing vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git $vundle
fi

if [ -f "${vimrc}" ] ; then
    notice "[vim] ${vimrc} already exists - skipping"
else
    cat ${workdir}/conf/vimrc > ${vimrc}
    notice "[vim] installing plugins"
    vim +PluginInstall +qall
fi

info "[vim] done"
