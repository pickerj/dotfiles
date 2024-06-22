#!/usr/bin/zsh

export PATH=$PATH:$HOME/.local/bin

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# Editor
export VISUAL="nvim"
export EDITOR="$VISUAL"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
#-- History
export HISTFILE=$ZDOTDIR/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# man pages
export MANPAGER='nvim +Man!'

# python
## ipython
export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
## virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
