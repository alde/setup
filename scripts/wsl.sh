#!/usr/bin/env bash

wslConfig="/etc/wsl.conf"
wslScript="${HOME}/.bash_scripts/wsl.sh"

if [ -f "${wslConfig}" ]; then
    notice "[WSL] ${wslConfig} already configured - skipping"
else
    cat << EOF | sudo tee -a ${wslConfig}
    [automount]
    enabled = true
    options = "metadata,umask=22,fmask=11"
EOF
fi

if [[ $(cat ${HOME}/.bash_profile) =~ "source ${wslScript}" ]] ; then
    notice "[WSL] bash profile already configured - skipping"
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

info "[WSL] done"
