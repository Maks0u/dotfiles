#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
sh ./_notRoot.sh "$0"

if [[ $# -eq 1 ]]; then
    VERSION="$1"
else
    VERSION="$(curl -fsSL -H 'Accept: application/vnd.github+json' \
        'https://api.github.com/repos/nodejs/node/releases/latest' \
        | jq -r '.tag_name')"
fi

INSTALL_DIR='/opt/node'
mkdir -p "${INSTALL_DIR}"

if [[ -d "${INSTALL_DIR}/${VERSION}" ]]; then
    printf '\n%s\n\n' "Node.js ${VERSION} already installed in ${INSTALL_DIR}"
    exit 0
fi

printf '\n%s\n\n' "Installing Node.js ${VERSION} in ${INSTALL_DIR}"

cd "${INSTALL_DIR}"
curl --location --progress-bar -O "https://nodejs.org/dist/${VERSION}/node-${VERSION}-linux-x64.tar.xz"
curl --location --progress-bar -o './nodejs-keyring.kbx' 'https://github.com/nodejs/release-keys/raw/HEAD/gpg/pubring.kbx'
curl --location --progress-bar -o './SHASUMS256.txt.asc' "https://nodejs.org/dist/${VERSION}/SHASUMS256.txt.asc"
gpgv --keyring='./nodejs-keyring.kbx' --output './SHASUMS256.txt' < './SHASUMS256.txt.asc'
sha256sum --check './SHASUMS256.txt' --ignore-missing

tar xf "./node-${VERSION}-linux-x64.tar.xz" -C "${INSTALL_DIR}"

mv "./node-${VERSION}-linux-x64" "./${VERSION}"
rm -f './active'
ln -sr "./${VERSION}" './active'

PATH="${INSTALL_DIR}/active/bin:${PATH}"
node --version
npm --version
printf '\n%s\n\n' "Node.js ${VERSION} installed in ${INSTALL_DIR}"

rm \
    "./node-${VERSION}-linux-x64.tar.xz" \
    './SHASUMS256.txt' \
    './SHASUMS256.txt.asc' \
    './nodejs-keyring.kbx'
