picom --backend xrender -b
wal -R -q && 
xdotool key Alt+n
setxkbmap -layout us,ara -variant , -option grp:win_space_toggle
setxkbmap -option caps:escape
slstatus &
xset s off -dpms
