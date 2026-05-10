#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
