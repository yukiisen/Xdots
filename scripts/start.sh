picom -b --backend xrender
pgrep pulseaudio >/dev/null || pulseaudio &
pgrep redshift >/dev/null || redshift -l 36.7:3.2 &
wal -R -q && 
xdotool key Alt+n
setxkbmap -layout us,ara -variant , -option grp:win_space_toggle
setxkbmap -option caps:escape
slstatus &
xset s off -dpms
