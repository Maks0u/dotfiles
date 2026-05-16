if [ "$(id -u)" -eq 0 ]; then
    printf '\n%s\n\n' "Please do not run this as root"
    exit 1
fi
