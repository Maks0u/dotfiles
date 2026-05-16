if [ ! "$(id -u)" -eq 0 ]; then
    printf '\n%s\n\n' "Please run as root using 'sudo -E ${1:-<script>}'"
    exit 1
fi
