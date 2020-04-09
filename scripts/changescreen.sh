#!/bin/bash

moncount=`xrandr | grep connected | grep -v "disconnected" | wc -l`
echo $moncount
if [ $moncount -eq "1" ];
then
	$XDG_CONFIG_HOME/screenlayout/laptop-undocked.sh
elif [ $moncount -eq "2" ];
then
	$XDG_CONFIG_HOME/screenlayout/laptop-docked.sh
fi
