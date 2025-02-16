if status is-interactive
    # Commands to run in interactive sessions can go here
end


alias uwufetch="uwufetch --config ~/.config/uwufetch/config.conf"
alias l="exa --icons --group-directories-first"
alias start="~/.scripts/start.sh"
alias wallpaper="~/.scripts/wallpaper.sh"

set -Ux ANDROID_HOME $HOME/Android/Sdk

set -U fish_user_paths $ANDROID_HOME/cmdline-tools/latest/bin $ANDROID_HOME/platform-tools $ANDROID_HOME/build-tools/34.0.0 $fish_user_paths
