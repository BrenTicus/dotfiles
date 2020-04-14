#!/bin/bash

lockimg_path=$XDG_CONFIG_HOME/img/lockimg.png
background_path=$FEH_BACKGROUND
background_name=$(basename "${background_path%.*}")
cache_dir=$XDG_CACHE_HOME/i3lock
blurred_path=$cache_dir/blur-$background_name.png
combinedlock_path=$cache_dir/templock-$background_name.png

[[ -d $cache_dir ]] || mkdir $cache_dir

[[ -f $blurred_path ]] || convert $background_path -blur 0x4 $blurred_path
[[ -f $combinedlock_path ]] || composite -blend 60 -alpha background $lockimg_path $blurred_path $combinedlock_path

i3lock -i $combinedlock_path
