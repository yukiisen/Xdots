picom -b
wal -R -t -q && 
xdotool key Alt+n
setxkbmap -layout us,ara -variant , -option grp:win_space_toggle
setxkbmap -option caps:escape
slstatus &
disown
