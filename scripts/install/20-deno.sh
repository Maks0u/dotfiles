#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
sh ./_notRoot.sh

[[ -z "${DENO_INSTALL}" ]] && printf 'DENO_INSTALL is not defined\n' && exit 1

curl -fsSL https://deno.land/install.sh | sh -s -- --no-modify-path --yes

PATH="${DENO_INSTALL}/bin:${PATH}"
deno --version
printf '\n%s\n\n' "Deno installed in ${DENO_INSTALL}"

mkdir -p "${DENO_INSTALL}/completions"
deno completions zsh > "${DENO_INSTALL}/completions/_deno.zsh"
