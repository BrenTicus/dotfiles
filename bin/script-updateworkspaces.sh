#!/bin/sh

WORKSPACES=`hyprctl workspaces | rg -o '[0-9]\)' | sed -e 's/)//'`
ACTIVE_WORKSPACE=`hyprctl activeworkspace | rg -o '[0-9]\)' | sed -e 's/)//'`

WS_ACTIVE_CLASS='ws-active'
WS_USED_CLASS='ws-used'
WS_INACTIVE_CLASS='ws-inactive'
WS_ARRAY_OUTPUT=($WS_INACTIVE_CLASS $WS_INACTIVE_CLASS $WS_INACTIVE_CLASS $WS_INACTIVE_CLASS $WS_INACTIVE_CLASS $WS_INACTIVE_CLASS)

for ws in $WORKSPACES
do
	idx=$(($ws - 1))
	if [ $ws = $ACTIVE_WORKSPACE ]; then
		WS_ARRAY_OUTPUT[$idx]=$WS_ACTIVE_CLASS
	else
		WS_ARRAY_OUTPUT[$idx]=$WS_USED_CLASS
	fi
done

for ((i = 0; i < ${#WS_ARRAY_OUTPUT[@]}; i++));
do
	ws=$(($i + 1))
	eww update workspace_${ws}_class=${WS_ARRAY_OUTPUT[$i]}
done
