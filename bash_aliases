# basic aliases
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# my basic aliases
alias kbsk='setxkbmap sk qwerty'
alias tt='cd /tmp/tst/'
alias dtt='cd $HOME/Documents/tmp'
alias nv='nvim'
alias nvm='nvim'
alias vlcd='devour vlc'
alias open='devour xdg-open'
alias xopen='xdg-open'
alias intellij-idea-community-edition='idea'
alias xc='xclip -selection c'
alias running_services='systemctl list-units  --type=service  --state=running'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# exit aliases
alias exot='exit'
alias ext='exit'
alias eixt='exit'
alias euxt='exit'
alias exut='exit'
alias q='exit'

# php aliases 
alias phpS='php -S 127.0.0.1:5500'
alias phpS1='php -S 127.0.0.1:5501'
alias php7S='php7 -S 127.0.0.1:5500'
alias php7S1='php7 -S 127.0.0.1:5501'

# git aliases 
alias gitS='git status'
alias gitPh='git push'
alias gitPu='git pull'
alias glog='git log --all --graph --decorate --oneline'

# cd aliases
alias czap='cd ~/Documents/c/tuke/zs1/prog-2022/'

# mining a monero
alias xrig="xmrig -o gulf.moneroocean.stream:10128 -u 4AYxh7FPLqvcqV3z5bK2px2P8zUcvysVNR9MiixKFUNUCngqv7as1HrGV2NhJGR9KQe2bM4vVAgcBYtKe2j2PtVi79bUs1t -p youShouldNotSeeThisName --cpu-max-threads-hint 50"
alias suck="[ -f config.def.h ] && rm -f config.h; sudo make clean install"
alias cdwm='cd ~/.local/src/dwm'

# C development
alias valgrind-mem-check='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes'
alias cppcheck-ultra='cppcheck --enable=warning,performance,unusedFunction --error-exitcode=1'

# others
alias currdate='date "+%Y-%b/%m-%d, %a, %H:%M"'
