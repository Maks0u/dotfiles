# git log graph with custom columns
git_log_columns() {
    local width=$((${1:-$(tput cols)} - 1))
    local hashWidth=14
    local authorWidth=9
    local messageWidth=$((width - hashWidth - authorWidth - 17))

    local config="%w(${width})%C(auto)"
    local hash="%<|(${hashWidth})%C(blue)%h %C(auto)"
    local message="%<(${messageWidth},trunc)%s "
    local author="%C(blue)%<(${authorWidth},trunc)%an%C(auto) "
    local date="%C(green)%>|(${width})%ar%C(auto)"
    local decorate="%D"

    git log --all --graph --max-count=${2:-500} \
        --pretty=format:"${config}${hash}${message}${author}${date} ${decorate}"
}

gloc() {
    git_log_columns "${1:-80}" "${@}"
}

glocw() {
    watch --color --interval 1 --no-title -x bash -c '. ~/dotfiles/.zshrc.d/functions.sh; gloc $(tput cols) 50'
}
