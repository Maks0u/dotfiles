# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

# nvim
export PATH=/opt/nvim/active/bin:$PATH
alias svim='EDITOR=/opt/nvim/active/bin/nvim sudo -e'

# Node
export PATH=/opt/node/active/bin:$PATH
alias biome='npx @biomejs/biome'

# Rust
export RUSTUP_HOME=/opt/rust/.rustup
export CARGO_HOME=/opt/rust/.cargo
[[ -f ${CARGO_HOME}/env ]] && source ${CARGO_HOME}/env

# Hurl
export PATH=/opt/hurl/active/bin:$PATH
source /opt/hurl/active/completions/_hurl
source /opt/hurl/active/completions/_hurlfmt

export EDITOR='vim'
# export PAGER='vim -nR +AnsiEsc -'
export PAGER='less'
export VISUAL='vim'

len()
{
    local str="${1}"
    echo "${#str}"
}

alias proxy="${HOME}/dev/proxy/proxy.sh"
alias webdeck="${HOME}/dev/twitch/webdeck/webdeck.sh"
alias kokoro="${HOME}/dev/tts/kokoro-fastapi.sh"

. "${HOME}/.deno/env"

alias serve='deno run --allow-net --allow-read jsr:@maks0u/cli-serve'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
