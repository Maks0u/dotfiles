#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [[ ! "${EUID}" -eq 0 ]]; then
    echo "Please run as root using 'sudo -E $0'"
    exit 1
fi

INSTALL_DIR='/opt/hurl'

if [[ -d "${INSTALL_DIR}" ]]; then
    printf '\n%s\n\n' "HURL already installed in ${INSTALL_DIR}"
    exit 0
fi

mkdir -p "${INSTALL_DIR}"
VERSION="$(curl -fsSL -H 'Accept: application/vnd.github+json' \
    'https://api.github.com/repos/Orange-OpenSource/hurl/releases/latest' \
    | jq -r '.tag_name')"

curl --location --progress-bar \
    "https://github.com/Orange-OpenSource/hurl/releases/download/${VERSION}/hurl-${VERSION}-x86_64-unknown-linux-gnu.tar.gz" \
    | tar xz -C "${INSTALL_DIR}"

mv "${INSTALL_DIR}/hurl-${VERSION}-x86_64-unknown-linux-gnu" "${INSTALL_DIR}/${VERSION}"
ln -sr "${INSTALL_DIR}/${VERSION}" "${INSTALL_DIR}/active"

PATH="${INSTALL_DIR}/active/bin:${PATH}"
hurl --version
printf '\n%s\n\n' "HURL installed in ${INSTALL_DIR}"
