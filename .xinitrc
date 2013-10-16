# run urxvt daemon
urxvtd -q -o -f

# set keyboard parameters
setxkbmap -layout "us,ru,us"
setxkbmap -variant "dvp,,"
setxkbmap -option "grp_led:caps"

# start keyboard switcher (see ~/.config/loloswitcher/config.ini)
/usr/sbin/loloswitcher &

# start key grubber
xbindkeys &

# remap keys
xmodmap ~/.Xmodmap &

# make an alone Control release equal to Escape
xcape &

# automaticaly disable touchpad
./scripts/touchoff &

# start dwm
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3 
