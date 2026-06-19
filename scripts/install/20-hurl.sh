#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
sh ./_notRoot.sh "$0"

if [[ $# -eq 1 ]]; then
    VERSION="$1"
else
    VERSION="$(curl -fsSL -H 'Accept: application/vnd.github+json' \
        'https://api.github.com/repos/Orange-OpenSource/hurl/releases/latest' \
        | jq -r '.tag_name')"
fi

INSTALL_DIR='/opt/hurl'
mkdir -p "${INSTALL_DIR}"

if [[ -d "${INSTALL_DIR}/${VERSION}" ]]; then
    printf '\n%s\n\n' "HURL ${VERSION} already installed in ${INSTALL_DIR}"
    exit 0
fi

printf '\n%s\n\n' "Installing HURL ${VERSION} in ${INSTALL_DIR}"

curl --location --progress-bar \
    "https://github.com/Orange-OpenSource/hurl/releases/download/${VERSION}/hurl-${VERSION}-x86_64-unknown-linux-gnu.tar.gz" \
    | tar xz -C "${INSTALL_DIR}"

printf '\n'

mv "${INSTALL_DIR}/hurl-${VERSION}-x86_64-unknown-linux-gnu" "${INSTALL_DIR}/${VERSION}"
rm -f "${INSTALL_DIR}/active"
ln -sr "${INSTALL_DIR}/${VERSION}" "${INSTALL_DIR}/active"

PATH="${INSTALL_DIR}/active/bin:${PATH}"
hurl --version
printf '\n%s\n\n' "HURL ${VERSION} installed in ${INSTALL_DIR}"
