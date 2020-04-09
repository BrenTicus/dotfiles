#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar-top.log
export PRIMARY_MONITOR=`xrandr --query | grep " primary" | cut -d" " -f1`
polybar top >>/tmp/polybar-top.log 2>&1 &

echo "Bars launched..."
