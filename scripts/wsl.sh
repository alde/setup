#!/usr/bin/env bash

wslConfig="/etc/wsl.conf"
wslScript="${HOME}/.bash_scripts/wsl.sh"

vimrc="${HOME}/.vimrc"
if [[ $(uname -r) =~ "Microsoft" ]] ; then 
    printf "[WSL] Setting up Windows Subsystem for Linux\n"

    if [ -f "${wslConfig}" ]; then
    printf "[WSL] ${wslConfig} already configured - skipping\n"
    else
        cat << EOF | sudo tee -a ${wslConfig}
        [automount]
        enabled = true
        options = "metadata,umask=22,fmask=11"
EOF
    fi

    if [[ $(cat ${HOME}/.bash_profile) =~ "source ${wslScript}" ]] ; then
        printf "[WSL] bash profile already configured - skipping\n"
    else
        mkdir -p ${HOME}/.bash_scripts/
        cat << EOF > ${wslScript}
        #!/usr/bin/env bash

        if [[ "$(umask)" = "0000" ]]; then
            umask 0022
        fi

        cd $HOME
EOF
        echo "source ${wslScript}" >> "${HOME}/.bash_profile"
    fi


else
    printf "[WSL] Doesn't appear to be running WSL - skipping"

fi

printf "[WSL] done\n"
