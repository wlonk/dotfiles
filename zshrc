#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
setopt autopushd

#--------------------------------------------
# environment variables
export HISTCONTROL=ignoreboth
export EDITOR=vim
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENV_DISTRIBUTE=1
export PYTHONDONTWRITEBYTECODE=1
export DISABLE_AUTO_TITLE=true
export RUST_SRC_PATH=$HOME/code/libs/rust/src

# Burn Java with fire:
export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'

# Set up M1 macOS Homebrew path:
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Add maven 3.8 to path:
export PATH="/Users/kit.diggeslatouche/lib/apache-maven-3.8.8/bin:$PATH"

# Handle many parallel Python versions through PyEnv:
if (( $+commands[pyenv] )); then
    export VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/shims/python3
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    export PATH="$PYENV_ROOT/shims:$PATH"
    eval "$(pyenv init -)"
    pyenv virtualenvwrapper_lazy
fi

# Prepend rustup:
export PATH="$HOME/.cargo/bin:$PATH"

# Prepend itch.io's Butler:
export PATH="$HOME/Library/Application Support/itch/apps/butler:$PATH"

# Prepend my local bin dir:
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Set Google auth for Roughcast:
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.roughcast_credentials/roughcast-d258e0da06d9.json

#--------------------------------------------
# Tmux-Phi:
_tmux_phi() {
    local -a commands
    commands=("${(@f)$(lsvirtualenv -b)}")

    if (( CURRENT == 2 )); then
        _describe -t commands 'commands' commands
    fi

    return 0
}
compdef _tmux_phi tmux-phi

#--------------------------------------------
# Aliases:
alias v="vim"
alias vi="vim"
alias vs="vim -S"
alias vo="vim -O"
alias bubu="brew update && brew upgrade && brew cleanup"
alias vup="vim +PluginInstall! +PluginClean! +qall"
alias buvu="bubu && vup"
alias ls='lsd --icon never'
alias l="ls -laF"
alias ll="ls -laF"
alias ffs='sudo !!'
alias gir="yes doom"

# Currently, Hub has broken tab completion of git commands and git branches
# with recent versions of git. See https://github.com/github/hub/issues/2684
# Until this is fixed, we won't use hub as a wrapper for git.
# alias g="hub"
alias g="git"

alias tp="tmux-phi"
alias j="jobs"
alias h="heroku"
alias bx="bundle exec"
alias now='date "+%Y-%m-%d::%H:%M"'
alias today='date "+%Y-%m-%d"'
# `cat` with beautiful colors. requires Pygments installed.
# pip install Pygments
alias c='pygmentize -O style=monokai -f console256 -g'  
alias hd='hexdump -C'

#--------------------------------------------
# nvm setup:
export NVM_DIR=$HOME/.nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

# Set up fzf:
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#--------------------------------------------
# Source secrets:
if [[ -f .dev-env ]]; then
    source .dev-env
fi

if [[ -f .secrets ]]; then
    source .secrets
fi

# The next lines update PATH for the Google Cloud SDK.
if [ -f "$HOME/lib/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/lib/google-cloud-sdk/path.zsh.inc"; fi

# The next lines enable shell command completion for gcloud.
if [ -f "$HOME/lib/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/lib/google-cloud-sdk/completion.zsh.inc"; fi

if [ -f "$HOME/.docker/init-zsh.sh" ]; then
    source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kit.diggeslatouche/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kit.diggeslatouche/lib/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kit.diggeslatouche/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kit.diggeslatouche/lib/google-cloud-sdk/completion.zsh.inc'; fi


# Load Angular CLI autocompletion.
source <(ng completion script)
