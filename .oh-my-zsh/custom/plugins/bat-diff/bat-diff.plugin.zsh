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
