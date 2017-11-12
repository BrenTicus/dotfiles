#!/bin/bash

# Terminate already running bar instances owned by the current user
killall -u $USER -q polybar

# Wait until the processes have been shut down
while pgrep -u $USER -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar top &
