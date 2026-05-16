#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
sh ./_root.sh "$0"

snap install --classic aws-cli
