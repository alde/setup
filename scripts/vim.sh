#!/usr/bin/env bash

vundle="${HOME}/.vim/bundle/Vundle.vim"
vimrc="${HOME}/.vimrc"
printf "[vim] Setting up vim\n"

if [[ "x${DISTRIB_ID}" == "xUbuntu" ]] ; then
    sudo apt install -y vim
fi

if [ -d "${vundle}" ] ; then
    printf "[vim] vundle already installed - updating\n"
    (cd ${vundle} && git pull)
else
    printf "[vim] installing vundle\n"
    git clone https://github.com/VundleVim/Vundle.vim.git $vundle
fi

if [ -f "${vimrc}" ] ; then
    printf "[vim] ${vimrc} already exists - skipping\n"
else
    cat ../conf/vimrc > ${vimrc}
    printf "[vim] installing plugins\n"
    vim +PluginInstall +qall
fi

printf "[vim] done\n"