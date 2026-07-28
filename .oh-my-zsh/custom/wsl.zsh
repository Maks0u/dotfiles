if [[ $(uname -r) =~ 'microsoft-standard-WSL2' ]]; then
    ssh-github() {
        eval $(ssh-agent)
        ssh-add ~/.ssh/id_ed25519_github
    }

    winhome() {
        wslpath -u "$(powershell.exe '$env:USERPROFILE')" | tr -d '\r'
    }

    # export WINHOME="$(winhome)" # slow start

    alias proxy="${HOME}/dev/proxy/proxy.sh"
    alias webdeck="${HOME}/dev/twitch/webdeck/webdeck.sh"
    alias kokoro="${HOME}/dev/tts/kokoro-fastapi.sh"
fi
