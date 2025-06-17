# git log graph with custom columns
# $1: width (default terminal width)
git_log_columns() {
    # Calculate viewport width
    local terminalWidth=$(tput cols)
    local width=$((${terminalWidth} - 1))

    # Calculate maximum width of the graph
    local graphWidth=$(git log --graph --pretty=format:'' "${@}" |
        awk '{ print length }' |
        sort --numeric-sort --reverse --unique |
        head -n 1)

    # Configure column widths
    local hashWidth=$((graphWidth + 7))
    local authorWidth=12
    local dateWidth=12

    # Setup format strings
    local config="%w(${width})%C(auto)"
    local hash="%>|(${hashWidth})%C(blue)%h%C(auto)"
    local decorate="%D"
    local message="%<|($((width - authorWidth - dateWidth - 2)),trunc)%s"
    local author="%C(blue)%<(${authorWidth},trunc)%an%C(auto)"
    local date="%C(green)%>|($width,trunc)%ar%C(auto)"

    # Run git log with the calculated format
    git log --graph --color \
        --pretty=format:"${config}${hash} ${decorate}  ${message} ${author} ${date}" \
        "${@}"
}

alias gloc='git_log_columns'

# alias for git_log_columns --all
gloca() {
    git_log_columns --all "${@}"
}

# watch alias for git_log_columns
glocw() {
    watch --color --interval 2 --no-title \
        -x zsh -c '. $ZSH/custom/git.zsh; git_log_columns -60 --all'
}

# git status short watch
alias gssw='watch -ctn 2 git -c color.ui=always status --short'
# git status branch watch
alias gsbw='watch -ctn 2 git -c color.ui=always status --short --branch'

# Show git diff with bat
bat_diff() {
    local diff=$(git diff --color=always ${1})
    if [[ -z "${diff}" ]]; then
        echo "No changes."
    else
        echo "${diff}" | bat --file-name="${1:-Current} diff" --language=diff --paging=always --wrap=never
    fi
}
alias bd='bat_diff'

# Show git diff for a specific commit with bat_diff
commit_diff() {
    local commit_hash=${1:-HEAD}
    bat_diff "${commit_hash}^!"
}
alias cdd='commit_diff'

alias gdc='git diff --compact-summary'

# Show compact summary of git diff for a specific commit
commit_diff_compact() {
    local commit_hash=${1:-HEAD}
    git diff --compact-summary "${commit_hash}^!"
}
alias cdc='commit_diff_compact'

# commit function with gum (https://github.com/charmbracelet/gum)
commit() {
    local TYPE=$(gum filter "chore" "docs" "feat" "fix")
    local SCOPE=$(gum input --placeholder "scope")
    test -n "${SCOPE}" && SCOPE="(${SCOPE})"

    local SUMMARY=$(gum input --value "${TYPE}${SCOPE}: " --placeholder "message")
    local DESCRIPTION=$(gum write --placeholder "Details")

    git status --short --branch
    bat --file-name="Commit summary" <<<"${SUMMARY}

${DESCRIPTION}"

    gum confirm "Commit changes?" && git commit -m "${SUMMARY}" -m "${DESCRIPTION}"
}
