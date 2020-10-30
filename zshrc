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
# For docker on OS X only:
# if (( $+commands[docker-machine] )); then
#     eval $(docker-machine env default 2> /dev/null)
# fi
# Burn Java with Fire.
export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
# Handle many parallel Python versions through PyEnv
if (( $+commands[pyenv] )); then
    export VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/shims/python3
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    pyenv virtualenvwrapper_lazy
fi
# Set up virtualenvwrapper
# source $HOME/.pyenv/shims/virtualenvwrapper.sh

# Prepend rustup:
export PATH="$HOME/.cargo/bin:$PATH"
# Prepend my local bin dir:
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

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
alias g="hub"
alias p="pipenv run python"
alias pm="pipenv run python manage.py"
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

_ssh_auth_save() {
    SOCK_LINK="$HOME/.ssh/ssh-auth-sock"
    if [[ -n $SSH_AUTH_SOCK && "$SSH_AUTH_SOCK" != "$SOCK_LINK" ]]; then
        ln -sf "$SSH_AUTH_SOCK" "$SOCK_LINK"
    fi
}

### Switchers: rbenv, nvm
# rbenv setup:
eval "$(rbenv init -)"

# nvm setup:
export NVM_DIR=$HOME/.nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

if [[ -f .dev-env ]]; then
    source .dev-env
fi

if [[ -f .secrets ]]; then
    source .secrets
fi


# source "$HOME/.local/share/dephell/_dephell_zsh_autocomplete"
