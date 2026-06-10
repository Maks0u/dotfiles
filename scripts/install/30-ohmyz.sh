#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")"
sh ./_notRoot.sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
