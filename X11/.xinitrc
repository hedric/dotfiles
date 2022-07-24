# Displays
xrandr --output DisplayPort-1 --rate 144 --mode 2560x1440 --pos 0x0 --primary
xrandr --output DisplayPort-2 --rate 144 --mode 1920x1080 --right-of DisplayPort-1 

xrandr --dpi 96

# Keyboard repeat rate
xset r rate 175 50

# Turn off mouse acceleration
xset m 1/1 0

# Disable screensaver
xset s off

# Disable power management for display
xset s off -dpms

# Keybind for language switching
setxkbmap -layout us,se
setxkbmap -option 'grp:ctrl_alt_toggle'

# Fix Wacom
# xsetwacom set "Wacom Intuos S Pen stylus" area 0 0 15200 8550
# xsetwacom set "Wacom Intuos S Pen stylus" pressurecurve 0 100 100 100

# Get rid of ugly cross(X)-cursor
xsetroot -cursor_name left_ptr

# Set mouse speed with no acceleration
xinput set-prop 15 "Coordinate Transformation Matrix" 2.4 0 0 0 2.4 0 0 0 1

# Set wallpaper restore
nitrogen --restore &

# Start compositor
# picom &

# Start i3
exec i3 --shmlog-size=26214400
