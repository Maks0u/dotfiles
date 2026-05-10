#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [[ ! "${EUID}" -eq 0 ]]; then
    echo "Please run as root using 'sudo -E $0'"
    exit 1
fi

INSTALL_DIR='/opt/nvim'

if [[ -d "${INSTALL_DIR}" ]]; then
    printf '\n%s\n\n' "Neovim already installed in ${INSTALL_DIR}"
    exit 0
fi

mkdir -p "${INSTALL_DIR}"
VERSION="$(curl -fsSL -H 'Accept: application/vnd.github+json' \
    'https://api.github.com/repos/neovim/neovim/releases/latest' \
    | jq -r '.tag_name')"

curl --location --progress-bar \
    "https://github.com/neovim/neovim/releases/download/${VERSION}/nvim-linux-x86_64.tar.gz" \
    | tar xz -C "${INSTALL_DIR}"

mv "${INSTALL_DIR}/nvim-linux-x86_64" "${INSTALL_DIR}/${VERSION}"
ln -sr "${INSTALL_DIR}/${VERSION}" "${INSTALL_DIR}/active"

PATH="${INSTALL_DIR}/active/bin:${PATH}"
nvim --version
printf '\n%s\n\n' "Neovim installed in ${INSTALL_DIR}"
