#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --output DisplayPort-0 --rate 144 --mode 2560x1440 --primary
xrandr --output DVI-D-0 --rate 120 --mode 1920x1080

# Keyboard repeat rate
xset r rate 175 50

# Disable screensaver
xset s off

# Get rid of ugly cross(X)-cursor
xsetroot -cursor_name left_ptr

# TODO: Pajlada
# Load custom xmodmap keyboard-layout

# Set wallpaper restore
nitrogen --restore &

# Start sxhk demon
sxhkd &

# Start window manager
exec bspwm 2> .logs/bspwm.err > .logs/bspwm.log
