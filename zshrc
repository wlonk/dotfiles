# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
case $HOST in
    drop.transneptune.net)
        ZSH_THEME="cypher"
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

# If I mean to cd, I'll cd.
DISABLE_VENV_CD=1

# Put this before the plugins, so they use the correct PATH.
export PATH=$HOME/bin:$HOME/.cargo/bin:/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:$HOME/code/android-sdk-macosx/tools:$PATH
# Define this before we load the virtualenvwrapper plugin, so that it will use
# the right Python.
if (( $+commands[pyenv] )); then
    export VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/shims/python3
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    django
    fabric
    git
    github
    osx
    pip
    python
    tmux
    virtualenvwrapper
)

source $ZSH/oh-my-zsh.sh

# Show background processes in prompt:
export PROMPT="%(1j.%{$fg[yellow]%}<%j>%{$reset_color%} .)$PROMPT"

ZSH_THEME_HG_PROMPT_PREFIX="%{$fg_bold[magenta]%}hg:(%{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[magenta]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN="%{$fg[magenta]%})"

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
export DISABLE_AUTO_TITLE=true
export RUST_SRC_PATH=$HOME/code/libs/rust/src
# For docker on OS X only:
if (( $+commands[docker-machine] )); then
    eval $(docker-machine env default 2> /dev/null)
fi
# Burn Java with Fire.
export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
# Handle many parallel Python versions through PyEnv
if (( $+commands[pyenv] )); then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# Tmux-phi autocomplete
_tmux_phi() {
    local -a commands
    commands=("${(@f)$(lsvirtualenv -b)}")

    if (( CURRENT == 2 )); then
        _describe -t commands 'commands' commands
    fi

    return 0
}
compdef _tmux_phi tmux-phi

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
alias vo="vim -O"
alias bubu="brew update && brew upgrade && brew cleanup"
alias vup="vim +PluginInstall! +PluginClean! +qall"
alias buvu="bubu && vup"
alias ll="ls -lFha"
alias ffs='sudo !!'
alias gir="yes doom"
alias p="ipython || python"
alias tp="tmux-phi"
alias j="jobs"
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
case $HOST in
    drop.transneptune.net)
        /usr/bin/keychain $HOME/.ssh/id_rsa
        source $HOME/.keychain/$HOST-sh
        ;;
    *)
        alias tmux='_ssh_auth_save ; _zsh_tmux_plugin_run'
        ;;
esac

# rbenv setup:
eval "$(rbenv init -)"

if [[ -f .dev-env ]]; then
    source .dev-env
fi

if [[ -f .secrets ]]; then
    source .secrets
fi
