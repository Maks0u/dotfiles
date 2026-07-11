if command -v apt >/dev/null; then
    alias full-upgrade='sudo apt update && sudo apt full-upgrade && sudo apt autoremove --purge'
fi
