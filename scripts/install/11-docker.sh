#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
sh ./_root.sh "$0"

if ! command -v dnf >/dev/null; then
    printf '\n%s\n\n' 'OS not supported, please use Fedora based OS with DNF installed.'
    exit 1
fi

# https://docs.docker.com/engine/install/rhel/
# https://docs.docker.com/engine/install/fedora/

dnf remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-selinux \
    docker-engine-selinux \
    docker-engine \
    podman \
    runc

dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable docker.service
systemctl enable containerd.service

printf '\n%s\n\n' 'Installation done, run `sudo usermod -aG docker <user>` then start a new session to be able to run docker as user.'
