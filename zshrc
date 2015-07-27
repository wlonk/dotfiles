# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
case $HOST in
    drop.transneptune.net)
        ZSH_THEME="cloud"
        ;;
    *)
        ZSH_THEME="robbyrussell"
        ;;
esac

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Put this before the plugins, so they use the correct PATH.
export PATH=$HOME/bin:/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:$HOME/code/android-sdk-macosx/tools:$PATH
# Define this before we load the virtualenvwrapper plugin, so that it will use
# the right Python.
export VIRTUALENVWRAPPER_PYTHON=$(which python)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    brew
    django
    git
    github
    osx
    pip
    python
    tmux
    virtualenvwrapper
)

source $ZSH/oh-my-zsh.sh

setopt autopushd

# User configuration

#--------------------------------------------
# environment variables
export HISTCONTROL=ignoreboth
export EDITOR=vim
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENV_DISTRIBUTE=1
export PYTHONDONTWRITEBYTECODE=1
# For boot2docker on OS X only:
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/kit/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
# Burn Java with Fire.
export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v="vim"
alias vi="vim"
alias vs="vim -S"
alias vup="vim +PluginInstall! +PluginClean! +qall"
alias ll="ls -lFha"
alias ffs='sudo !!'
alias gir="yes doom"
# `cat` with beautiful colors. requires Pygments installed.
# pip install Pygments
alias c='pygmentize -O style=monokai -f console256 -g'  
alias hd='hexdump -C'
_ssh_auth_save() {
    ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh-auth-sock"
}
case $HOST in
    drop.transneptune.net)
        /usr/bin/keychain $HOME/.ssh/id_rsa
        source $HOME/.keychain/$HOST-sh
        ;;
    *)
        alias tmux='_ssh_auth_save ; _zsh_tmux_plugin_run'
        ;;
esac

if [[ -f .dev-env ]]; then
    source .dev-env
fi
