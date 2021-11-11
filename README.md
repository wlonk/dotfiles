# Dotfiles

Pretty much what you expect. Mostly, this is for my own benefit, to aid in
syncing across multiple machines.

Take a look if you want.

## Manual setup

There's some stuff I like to do to set up my terminal. First, I use iTerm2,
install DankMono.

To set it up such that tmux and a raw terminal both can use italics where
appropriate (such as in code comments):

```
cat << EOF > xterm-256color-italic.terminfo
xterm-256color-italic|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color,
EOF

cat << EOF > tmux-256color.terminfo
tmux-256color|tmux with 256 colors,
  ritm=\E[23m, rmso=\E[27m, sitm=\E[3m, smso=\E[7m, Ms@,
  khome=\E[1~, kend=\E[4~,
  use=xterm-256color, use=screen-256color,
EOF

tic -x xterm-256color-italic.terminfo
tic -x tmux-256color.terminfo

rm xterm-256color-italic.terminfo tmux-256color.terminfo
```

Set up system-wide Python defaults (once you've installed `pyenv` and `pipx`
through `brew`):

```
pyenv install 3.9.7
pyenv global 3.9.7
pipx ensurepath
pipx install virtualenvwrapper
pipx install dotfiles
```

Clone useful repos (dotfiles, prezto, prezto-contrib, Vundle, and tpm):

```
git clone git@github.com:wlonk/dotfiles.git
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
(cd $ZPREZTODIR && git clone --recurse-submodules https://github.com/belak/prezto-contrib contrib)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Set up symlinks to dotfiles repo:

```
ln -s $HOME/dotfiles/dotfilesrc .dotfilesrc
ln -s $HOME/dotfiles/zpreztorc .zpreztorc
ln -s $HOME/dotfiles/zshrc .zshrc
dotfiles -s .ackrc
dotfiles -s .cookiecutterrc
dotfiles -s .gitconfig
dotfiles -s .githelpers
dotfiles -s .gitignore
dotfiles -s .gituser
dotfiles -s .tmux.conf
dotfiles -s .vimrc
dotfiles -s .zlogin
dotfiles -s .zlogout
dotfiles -s .zprofile
dotfiles -s .zshenv
dotfiles -s .zshrc
```

In a new shell, with aliases set up:

```
vup
```

In `tmux`: `prefix+I` to install plugins.

Enable press-and-hold:

```
defaults write -g ApplePressAndHoldEnabled -bool false
```

Then restart.
