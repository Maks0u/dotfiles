#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [[ ! "${EUID}" -eq 0 ]]; then
    echo "Please run as root using 'sudo -E $0'"
    exit 1
fi

snap install --classic aws-cli
