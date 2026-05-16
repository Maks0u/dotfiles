#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
sh ./_root.sh "$0"

if [[ $# -eq 1 ]]; then
    VERSION="$1"
else
    VERSION="$(curl -fsSL -H 'Accept: application/vnd.github+json' \
        'https://api.github.com/repos/neovim/neovim/releases/latest' \
        | jq -r '.tag_name')"
fi

INSTALL_DIR='/opt/nvim'
mkdir -p "${INSTALL_DIR}"

if [[ -d "${INSTALL_DIR}/${VERSION}" ]]; then
    printf '\n%s\n\n' "Neovim ${VERSION} already installed in ${INSTALL_DIR}"
    exit 0
fi

printf '\n%s\n\n' "Installing Neovim ${VERSION} in ${INSTALL_DIR}"

curl --location --progress-bar \
    "https://github.com/neovim/neovim/releases/download/${VERSION}/nvim-linux-x86_64.tar.gz" \
    | tar xz -C "${INSTALL_DIR}"

printf '\n'

mv "${INSTALL_DIR}/nvim-linux-x86_64" "${INSTALL_DIR}/${VERSION}"
rm -f "${INSTALL_DIR}/active"
ln -sr "${INSTALL_DIR}/${VERSION}" "${INSTALL_DIR}/active"

PATH="${INSTALL_DIR}/active/bin:${PATH}"
nvim --version
printf '\n%s\n\n' "Neovim installed in ${INSTALL_DIR}"
