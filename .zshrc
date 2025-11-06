# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
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

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# WSL
winhome() {
    wslpath -u "$(powershell.exe '$env:USERPROFILE')" | tr -d '\r'
}
# Too long to execute at every startup
# export WINHOME=$(winhome)

# nvim
export PATH=/opt/nvim-linux-x86_64/bin:$PATH

# Node
export PATH=/opt/node/active/bin:$PATH
alias biome='npx @biomejs/biome'

# Hurl
export PATH=/opt/hurl/hurl-7.0.0/bin:$PATH
source /opt/hurl/hurl-7.0.0/completions/_hurl
source /opt/hurl/hurl-7.0.0/completions/_hurlfmt

alias full-upgrade='sudo apt update && sudo apt full-upgrade && sudo apt autoremove --purge'
alias nn='sudo netstat -antupe'
alias uu='sudo ufw status numbered'
alias authlog='tail -f /var/log/auth.log'
alias grep='grep --color=auto --ignore-case'

alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'

export EDITOR='vim'
# export PAGER='vim -nR +AnsiEsc -'
export PAGER='less'
export VISUAL='vim'

alias pdfmerge='gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/default -sOutputFile=out.pdf "$@"'
pdfsplit () {
    input=$1
    shift
    pageList=$@
    gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/default -sOutputFile=out.pdf -sPageList="${pageList}" "${input}"
}

ssh-github ()
{
    eval $(ssh-agent)
    ssh-add ~/.ssh/id_ed25519_github
}

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

alias aws='snap run aws-cli.aws'

alias commit='git commit --message'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
