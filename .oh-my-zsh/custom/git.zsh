# git log graph with custom columns
# $1: width (default terminal width)
git_log_columns() {
    local width=$((${1:-$(tput cols)} - 1))
    [[ ! -z $1 ]] && shift

    local hashWidth=14
    local authorWidth=12
    local dateWidth=12

    local config="%w(${width})%C(auto)"
    local hash="%>|(${hashWidth})%C(blue)%h%C(auto)"
    local decorate="%D"
    local message="%<|($((width - authorWidth - dateWidth - 2)),trunc)%s"
    local author="%C(blue)%<(${authorWidth},trunc)%an%C(auto)"
    local date="%C(green)%>|($width,trunc)%ar%C(auto)"

    git log --all --graph --color \
        --pretty=format:"${config}${hash} ${decorate}  ${message} ${author} ${date}" \
        "${@}"
}

# alias for git_log_columns
gloc() {
    git_log_columns "${@}"
}

# watch alias for git_log_columns
glocw() {
    watch --color --interval 3 --no-title -x zsh -c '. $ZSH/custom/git.zsh; gloc $(tput cols) -60'
}

# git status short watch
alias gssw='watch -ctn 3 git status --short'
# git status branch watch
alias gsbw='watch -ctn 3 git status --short --branch'
