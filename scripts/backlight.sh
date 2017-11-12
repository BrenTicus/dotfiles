#!/bin/bash

max=$(</sys/class/backlight/intel_backlight/max_brightness)
current=$(</sys/class/backlight/intel_backlight/brightness)
diff=$1
new=$((current + diff))
new=$((new > max ? max : new))
new=$((new > 0 ? new : 0))
`echo $new > /sys/class/backlight/intel_backlight/brightness`
