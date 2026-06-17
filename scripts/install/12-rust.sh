#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
sh ./_root.sh

export RUSTUP_HOME=/opt/rust/.rustup
export CARGO_HOME=/opt/rust/.cargo

curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y

printf '\n%s\n\n' "Uninstall using: 'sudo -E ${CARGO_HOME}/bin/rustup self uninstall'"
