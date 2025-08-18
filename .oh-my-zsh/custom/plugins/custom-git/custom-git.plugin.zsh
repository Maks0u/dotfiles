PLUGIN_PATH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/custom-git"

# git log graph with custom columns
git_log_columns() {
    "${PLUGIN_PATH}/git_log_columns.zsh" "${@}"
}
# Use git-log completions
compdef _git git_log_columns=git-log
# Aliases
alias gloc='git_log_columns'
alias gloca='git_log_columns --all'
alias gg='git_log_columns --all -25 | cat'
alias glocw="watch --color --interval 2 --no-title -x zsh -c '${PLUGIN_PATH}/git_log_columns.zsh -60 --all'"

# Visualize diverging branches
git_graph_merge_base() {
    local base="$(git merge-base "${@}")"
    "${PLUGIN_PATH}/git_log_columns.zsh" "${@}" "${base}"^!
}
# Use git-log completions
compdef _git git_graph_merge_base=git-log
# Aliases
alias ggb='git_graph_merge_base'

# git status short watch
alias gssw='watch -ctn 2 git -c color.ui=always status --short'
# git status branch watch
alias gsbw='watch -ctn 2 git -c color.ui=always status --short --branch'

# Show git diff with bat
bat_diff() {
    local diff=$(git diff --color=always ${@})
    if [[ -z "${diff}" ]]; then
        echo "No changes."
    else
        echo "${diff}" | bat --file-name="Diff" --language=diff --paging=always --wrap=never
    fi
}
# Use git-diff completions
compdef _git bat_diff=git-diff
# Aliases
alias bd='bat_diff'
alias bds='bat_diff --staged'

# Show git diff for a specific commit with bat_diff
commit_diff() {
    local commit_hash=${1:-HEAD}
    bat_diff "${commit_hash}^!"
}
# Use git-diff completions
compdef _git commit_diff=git-show-branch
# Aliases
alias cdd='commit_diff'

# Show compact summary of git diff for a specific commit
commit_diff_compact() {
    local commit_hash=${1:-HEAD}
    git diff --compact-summary "${commit_hash}^!"
}
# Use git-diff completions
compdef _git commit_diff_compact=git-show-branch
# Aliases
alias cdc='commit_diff_compact'

alias gdc='git diff --compact-summary'

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
