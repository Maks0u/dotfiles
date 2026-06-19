#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
sh ./_notRoot.sh

[[ -z "${RUSTUP_HOME}" ]] && printf 'RUSTUP_HOME is not defined\n' && exit 1
[[ -z "${CARGO_HOME}" ]] && printf 'CARGO_HOME is not defined\n' && exit 1

curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y

printf '\n%s\n\n' "Uninstall using: 'sudo -E ${CARGO_HOME}/bin/rustup self uninstall'"
