# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/usr/local/bin:$PATH
export PATH=${HOME}/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Auto-update
zstyle ':omz:update' mode auto

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    docker
    fzf
    git
    z
)

source $ZSH/oh-my-zsh.sh

# Antidote plugin manager

if [[ ! -d ~/.antidote ]]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
fi

source ~/.antidote/antidote.zsh
antidote load ~/.zsh_plugins.txt

# User configuration

export EDITOR='vim'
# export PAGER='vim -nR +AnsiEsc -'
export PAGER='less'
export VISUAL='vim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
