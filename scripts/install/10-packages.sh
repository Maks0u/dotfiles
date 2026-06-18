#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
sh ./_root.sh "$0"

packages=(
    'bat'
    'btop'
    'curl'
    'dnsutils'
    'fd-find'
    'fzf'
    'git'
    'htop'
    'jq'
    'net-tools'
    'ripgrep'
    'snapd'
    'sqlite'
    'stow'
    'tree'
    'zsh'
)

if command -v dnf >/dev/null; then
    printf '\nInstalling packages using DNF.\n\n';

    dnf upgrade
    dnf config-manager --set-enabled crb
    dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
    dnf install "${packages[@]}"

    exit 0
fi

if command -v apt >/dev/null; then
    printf '\nInstalling packages using APT.\n\n';

    apt update
    apt full-upgrade
    apt install "${packages[@]}"

    [[ -f '/usr/bin/batcat' ]] && ln -s /usr/bin/batcat ~/.local/bin/bat
    [[ -f '/usr/bin/fdfind' ]] && ln -s /usr/bin/fdfind ~/.local/bin/fd

    exit 0
fi
