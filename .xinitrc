# variables

# set keyboard parameters
setxkbmap -layout "us,ru"
setxkbmap -option "grp_led:caps, compose:ralt"

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

# set status bar
#while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
#do
	#sleep 1
#done &

# start dwm
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3 
