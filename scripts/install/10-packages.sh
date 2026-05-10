#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [[ ! "${EUID}" -eq 0 ]]; then
    echo "Please run as root using 'sudo -E $0'"
    exit 1
fi

packages=(
    'bat'
    'curl'
    'dnsutils'
    'fzf'
    'git'
    'htop'
    'net-tools'
    'ripgrep'
    'snapd'
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

    exit 0
fi
