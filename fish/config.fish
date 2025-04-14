if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set up dbus if it's not already running
if not set -q DBUS_SESSION_BUS_ADDRESS
    eval (dbus-launch --sh-syntax)
    set -gx DBUS_SESSION_BUS_ADDRESS $DBUS_SESSION_BUS_ADDRESS
end

# Set up XDG_RUNTIME_DIR if it's missing
if not set -q XDG_RUNTIME_DIR
    set -gx XDG_RUNTIME_DIR /run/user/(id -u)
end

alias play="mpv --ytdl-format=bestaudio -v --no-video"

alias uwufetch="uwufetch --config ~/.config/uwufetch/config.conf"
alias l="exa --icons --group-directories-first"
alias start="~/.scripts/start.sh"
alias wallpaper="~/.scripts/wallpaper.sh"

# mobile controls:
alias voice+="adb shell input keyevent 24"
alias voice-="adb shell input keyevent 25"
alias openlark="adb shell input tap 300 1250"
alias voiceonly="adb shell input tap 50 950 && adb shell input tap 50 950"
alias videomode="adb shell input tap 300 400"

alias tap="adb shell input tap"
alias minput="adb shell input"

alias mplay="adb shell media dispatch play"
alias mpause="adb shell media dispatch pause"
alias mnext="adb shell media dispatch next"
alias mprev="adb shell media dispatch previous"

alias dscroll="adb shell input swipe 300 900 300 300"
alias uscroll="adb shell input swipe 300 300 300 900"

set -Ux ANDROID_HOME $HOME/Android/Sdk

set -U fish_user_paths $ANDROID_HOME/cmdline-tools/latest/bin $ANDROID_HOME/platform-tools $ANDROID_HOME/build-tools/34.0.0 $fish_user_paths

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export TERM kitty

# set --export TERM xterm-256color

# pnpm
set -gx PNPM_HOME "/home/yuki/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
