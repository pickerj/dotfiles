#!/usr/bin/zsh

#%=------=%#
# env vars #
#%=------=%#
source "$ZDOTDIR/.zshenv" # in case this has changed since login

#%=-----=%#
# aliases #
#%=-----=%#
source "$ZDOTDIR/.aliases"

#%=--------=%#
# navigation #
#%=--------=%#
setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

# Override colors
eval "$(dircolors -b $ZDOTDIR/dircolors)"

#%=-----=%#
# history #
#%=-----=%#
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

#%=---------=%#
# completions #
#%=---------=%#
setopt COMPLETE_ALIASES     # Treat aliases like distinct commands.
setopt COMPLETE_IN_WORD     # Complete from cursor location.
setopt CORRECT              # Spelling correction.
setopt GLOB_COMPLETE        # Completing on globs shows matching patterns instead of autofilling all matches.
source "$ZDOTDIR/completions.zsh"

#%=---------=%#
# keybindings #
#%=---------=%#
source "$ZDOTDIR/keybindings.zsh"

#%=----=%#
# prompt #
#%=----=%#
setopt TRANSIENT_RPROMPT  # Remove right prompt when accepting a command line.
fpath=($ZDOTDIR/themes $fpath)
source $ZDOTDIR/themes/prompt_theend_setup

#%=--------=%#
# virtualenv #
#%=--------=%#
if [ -f "/usr/share/virtualenvwrapper/virtualenvwrapper.sh" ]; then
	source "/usr/share/virtualenvwrapper/virtualenvwrapper.sh"
elif [ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]; then
	source "$HOME/.local/bin/virtualenvwrapper.sh"
else
	echo "virtualenvwrapper not installed globally or locally."
fi

#%=-=%#
# nvm #
#%=-=%#
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#%=--------=%#
# rust/cargo #
#%=--------=%#
source "$HOME/.cargo/env"

#%=-=%#
# ssh #
#%=-=%#
[ -n "$SSH_AUTH_SOCK" ] || eval "$(ssh-agent)" 1>/dev/null 2>&1


#%=-----=%#
# plugins # 
#%=-----=%#
source "$ZDOTDIR/plugins/zsh-history-substring-search.zsh"
zsh_syntax_file="/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [ -f "$zsh_syntax_file" ]; then
	source "$zsh_syntax_file"
else
	echo "Package \"zsh-syntax-highlighting\" not found. Try \`apt install zsh-syntax-highlighting\`."
fi

