#!/bin/bash

file=~/Pictures/Screenshots/screenshot-%Y-%m-%d-%T.png

scrot $file
notify-send "Screenshot saved to $file"
