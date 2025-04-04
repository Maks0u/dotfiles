#!/bin/sh
set -o errexit # abort on nonzero exitstatus
set -o nounset # abort on unbound variable

branch=${1:-main}

if [ -d "${HOME}/.config/nvim" ]; then
    mv -v ${HOME}/.config/nvim ${HOME}/.config/nvim.bak.$(date +%s)
fi
zipfile=$(mktemp --dry-run)
tempdir=$(mktemp --dry-run)
curl -fsSL "https://codeload.github.com/Maks0u/env/zip/refs/heads/${branch}" --output "$zipfile"
unzip -u "$zipfile" "env-${branch}/nvim/*" -d "$tempdir"
mv -v "${tempdir}/env-${branch}/nvim" ${HOME}/.config
rm -drv "$tempdir" "$zipfile"
