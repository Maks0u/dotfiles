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

    git log --graph --color \
        --pretty=format:"${config}${hash} ${decorate}  ${message} ${author} ${date}" \
        "${@}"
}

# alias for git_log_columns
gloc() {
    git_log_columns "${@}"
}

# alias for git_log_columns --all
gloca() {
    local width=$((${1:-$(tput cols)} - 1))
    [[ ! -z $1 ]] && shift
    git_log_columns $width --all "${@}"
}

# watch alias for git_log_columns
glocw() {
    watch --color --interval 3 --no-title \
        -x zsh -c '. $ZSH/custom/git.zsh; git_log_columns $(tput cols) -60 --all'
}

# git status short watch
alias gssw='watch -ctn 3 git -c color.ui=always status --short'
# git status branch watch
alias gsbw='watch -ctn 3 git -c color.ui=always status --short --branch'

# commit function with gum (https://github.com/charmbracelet/gum)
commit() {
    local TYPE=$(gum filter "chore" "docs" "feat" "fix")
    local SCOPE=$(gum input --placeholder "scope")
    test -n "${SCOPE}" && SCOPE="(${SCOPE})"

    local SUMMARY=$(gum input --value "${TYPE}${SCOPE}: " --placeholder "message")
    local DESCRIPTION=$(gum write --placeholder "Details")

    bat <<<"${SUMMARY}

${DESCRIPTION}"

    gum confirm "Commit changes?" && git commit -m "${SUMMARY}" -m "${DESCRIPTION}"
}
