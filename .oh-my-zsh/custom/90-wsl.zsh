ssh-github ()
{
    eval $(ssh-agent)
    ssh-add ~/.ssh/id_ed25519_github
}

winhome() {
    wslpath -u "$(powershell.exe '$env:USERPROFILE')" | tr -d '\r'
}
# Too long to execute at every startup
# export WINHOME=$(winhome)
