#!/usr/bin/env bash

gitConfigFile="${HOME}/.gitconfig"
if [ -f $(which git) ]; then
    notice "[git] already installed - skipping"
else
    info "[git] Setting up git"
    install git
fi

if [ -f "$gitConfigFile" ]; then
    notice "[git] $gitConfigFile already exists - skipping"
else
    notice "[git] Creating $gitConfigFile"
    printf "Username [${USER}]: "
    read userName

    if [[ "x${userName}" == "x" ]] ; then
        userName=${USER}
    fi

    printf "Email: "
    read email

    cat << EOF > $gitConfigFile
    [user]
        name = ${userName}
        email = ${email}

    [color]
        branch = auto
        diff = auto
        interactive = auto
        status = auto

    [alias]
    st = status -sb
    ci = commit
    br = branch
    co = checkout
    df = diff \
                    --minimal \
                    --word-diff=color \
                    --word-diff-regex='([0-9@A-Za-z]+|[^0-9@A-Za-z]+)'
    lg = log --graph --pretty=\"format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset\"
    fix = commit --amend --no-edit
    up = pull --rebase --autostash

    [push]
        default = current

    [core]
        editor = vim
        whitespace = trailing-space,space-before-tab
        pager = less -F -X

    [rebase]
        autosquash = true

    [advice]
        statusHints = false

    [rerere]
        enabled = true

    [merge]
        stat = true
        tool = meld
        conflictstyle = diff3

    [branch]
        autosetuprebase = always

EOF

    notice "[git] $gitConfigFile written"
fi

info "[git] done"
