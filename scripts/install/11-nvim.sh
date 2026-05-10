#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [[ ! "${EUID}" -eq 0 ]]; then
    echo "Please run as root using 'sudo -E $0'"
    exit 1
fi

install_dir='/opt/nvim-linux-x86_64'

if [[ -d "${install_dir}" ]]; then
    printf '\n%s\n\n' "Neovim already installed in ${install_dir}"
    exit 0
fi

tempfile='/tmp/nvim.tar.gz'
trap "rm -f '${tempfile}'" EXIT

curl --location --progress-bar 'https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz' --output "${tempfile}"

mkdir -p /opt
tar -xf "${tempfile}" -C /opt

PATH="${install_dir}/bin:${PATH}"
nvim --version
printf '\n%s\n\n' "Neovim installed in ${install_dir}"
