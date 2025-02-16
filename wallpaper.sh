WALLPAPER=$1

pkill mpv
pkill xwinwrap

xwinwrap -fs -nf -ov -- mpv -wid WID --loop --panscan=1 --no-audio --no-osc $WALLPAPER &
