set -g fish_greeting ""

# Set up dbus if it's not already running
if not set -q DBUS_SESSION_BUS_ADDRESS
    bass eval (dbus-launch --sh-syntax)
    set -gx DBUS_SESSION_BUS_ADDRESS $DBUS_SESSION_BUS_ADDRESS
end

# Set up XDG_RUNTIME_DIR if it's missing
if not set -q XDG_RUNTIME_DIR
    set -gx XDG_RUNTIME_DIR /run/user/(id -u)
end

if status is-interactive
    if test $TMUX # could be "set -q TMUX"
        alias fzf="fzf --tmux"
    end

    alias mpvsearch="mpv \$(find -maxdepth 4 | rg \"mp4|webm|mp3\" | fzf)"
    alias mpvlist="mpv \$(ls | fzf)"
    alias openpdf="evince \$(find -maxdepth 4 | rg .pdf | fzf) & disown "
end

function osu
    ~/Games/osu.AppImage &
    sleep 1800 && pkill osu
end

alias uwufetch="uwufetch --config ~/.config/uwufetch/config"

alias rcli="redis-cli"
alias rtui="redis_tui"

alias play="mpv --ytdl-format=\"bestvideo[height<=144]+bestaudio\" -v"
alias l="exa --icons --group-directories-first"
alias start="~/.scripts/start.sh"
alias wallpaper="~/.scripts/wallpaper.sh"
alias la="l -a"

# mobile controls:
alias voice+="adb shell input keyevent 24 & echo ok"
alias voice-="adb shell input keyevent 25 & echo ok"
alias openlark="adb shell input tap 300 1250"
alias voiceonly="adb shell input tap 50 950 && adb shell input tap 50 950 & echo ok"
alias videomode="adb shell input tap 300 400 & echo ok"

alias tap="adb shell input tap"
alias minput="adb shell input"

alias mplay="adb shell media dispatch play & echo ok"
alias mpause="adb shell media dispatch pause & echo ok"
alias mnext="adb shell media dispatch next & echo ok"
alias mprev="adb shell media dispatch previous & echo ok"

alias dscroll="adb shell input swipe 300 900 300 300"
alias uscroll="adb shell input swipe 300 300 300 900"

# zoxide init
zoxide init --cmd cd fish | source 

# Android Stuff
set --export ANDROID_HOME $HOME/Android
set --export PATH $ANDROID_HOME/cmdline-tools/latest/bin $PATH

set --export JAVA_HOME /usr/lib/jvm/openjdk21
set --export PATH $JAVA_HOME/bin $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
# Golang
set --export PATH $HOME/go/bin $PATH
# C libs
set --export PKG_CONFIG_PATH /usr/local/lib/pkgconfig $PKG_CONFIG_PATH
set --export PKG_CONFIG_PATH /usr/lib/pkgconfig $PKG_CONFIG_PATH

# enable this if xterm is not a known terminal type
# set --export TERM kitty

set --export TERM xterm-256color

# pnpm
set -gx PNPM_HOME "/home/yuki/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

function __complete_syncthing
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /usr/bin/syncthing
end
complete -f -c syncthing -a "(__complete_syncthing)"
