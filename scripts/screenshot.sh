#!/bin/bash

file=~/Pictures/Screenshots/screenshot-$(date "+%Y-%m-%d-%H:%M:%S").png

scrot -s $file
notify-send "Screenshot saved to $file"
