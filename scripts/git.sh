#!/usr/bin/env bash

gitConfigFile="${HOME}/.gitconfig"
printf "[git] Setting up git\n"

if [[ "x${DISTRIB_ID}" == "xUbuntu" ]] ; then
    sudo apt install -y git
fi


if [ -f "$gitConfigFile" ]; then
    printf "[git] $gitConfigFile already exists - skipping\n"
else
    printf "[git] Creating $gitConfigFile\n"
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

    printf "[git] $gitConfigFile written\n"
fi

printf "[git] done\n"