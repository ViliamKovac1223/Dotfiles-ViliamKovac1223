export EDITOR="vim"
# export BROWSER="firefox"
export TERM="st"
# export TERM="alacritty"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME="/lib/jvm/java-17-openjdk-amd64"
export QT_AUTO_SCREEN_SCALE_FACTOR=1.5

# make tst folder in /tmp/ if doesn't exist
if [ ! -d /tmp/tst ]; then
    mkdir /tmp/tst
fi

xset b off # get rid of noise while deleting nothing
setterm -blength 0
# set bell-style none
xset -b 

# enable clicks with touchpad
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# extend $PATH
if [ -d "$HOME/Games/airshipper-linux" ] ; then # add path to veloren game launcher
  PATH="$HOME/Games/airshipper-linux:$PATH"
fi

if [ -d "$HOME/.config/composer/vendor/bin" ] ; then
  PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

if [ -d "$HOME/script/availableFromSystem" ] ; then
  PATH="$HOME/script/availableFromSystem:$PATH"
fi

if [ -d "$HOME/.gem/ruby/2.7.0/bin" ] ; then
  PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
fi

if [ -d "$HOME/flutterSDK/flutter/bin" ] ; then
  PATH="$HOME/flutterSDK/flutter/bin:$PATH"
fi

if [ -d "/opt/flutter/bin" ] ; then
  PATH="/opt/flutter/bin:$PATH"
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi
. "$HOME/.cargo/env"

if [ -d "$HOME/.local/bin/nvim-linux64/bin" ] ; then
    PATH="$HOME/.local/bin/nvim-linux64/bin:$PATH"
fi

