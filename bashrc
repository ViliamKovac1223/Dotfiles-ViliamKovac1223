#  ____             _        ___ _____  ___
# / ___|  ___  _ __(_) __ _ / _ \___ / ( _ )
# \___ \ / _ \| '__| |/ _` | | | ||_ \ / _ \
#  ___) | (_) | |  | | (_| | |_| |__) | (_) |
# |____/ \___/|_|  |_|\__, |\___/____/ \___/
#                     |___/

# xhost +SI:localuser:viliam # add another user to X list, so they can run gui apps on the system too

# set vim mode in bash
set -o vi

# in vim mode ctrl+l doesn't work 
# by this you can activate clear-screen functionality
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# color promt
color_prompt=yes;

# color vim and another stuff
# PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1";

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# prompt 
# if [ "$color_prompt" = yes ]; then
  # PS1="\[\e[30m\]\[\e[42m\]\u@\h\[\e[44m\]\[\e[32m\]"$'\uE0B0'"\[\e[30m\]\w\[\e[46m\]\[\e[34m\]"$'\uE0B0'"\[\e[30m\]$ \[\e[00m\]\[\e[36m\]"$'\uE0B0'"\[\e[00m\]"
# else
  # PS1="\[\e[30m\]\[\e[42m\]\u@\h\[\e[44m\]\[\e[32m\]"$'\uE0B0'"\[\e[30m\]\w\[\e[46m\]\[\e[34m\]"$'\uE0B0'"\[\e[30m\]$ \[\e[00m\]\[\e[36m\]"$'\uE0B0'"\[\e[00m\]"
# fi

PS1='\[\033[1;32m\]\[\033[1;34m\]\w\[\033[0m\] \$ ' # back up prompt

unset color_prompt force_color_prompt

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -d "$HOME/Documents/python/save/term-streamer" ]; then
	export PATH="$HOME/Documents/python/save/term-streamer:$PATH"
fi

# PATH="/home/sorig/.local/bin:/home/sorig/Documents/python/save/term-streamer:/home/sorig/.local/bin:/home/sorig/script/availableFromSystem:/home/sorig/Games/airshipper-linux:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games"

export FZF_DEFAULT_COMMAND="rg --files -- hidden --follow --glob '!.git'"
. "$HOME/.cargo/env"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sorig/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sorig/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sorig/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sorig/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

