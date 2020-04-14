#!/bin/sh
# Based on https://github.com/polybar/polybar-scripts/blob/master/polybar-scripts/player-mpris-simple/player-mpris-simple.sh

player_status=$(qdbus org.mpris.MediaPlayer2.spotifyd /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus)

if [ "$player_status" = "Playing" ]; then
	artist=$(qdbus org.mpris.MediaPlayer2.spotifyd /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | sed -n -e 's/xesam:artist: //p')
	title=$(qdbus org.mpris.MediaPlayer2.spotifyd /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | sed -n -e 's/xesam:title: //p')
    echo "$artist - $title"
elif [ "$player_status" = "Paused" ]; then
	artist=$(qdbus org.mpris.MediaPlayer2.spotifyd /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | sed -n -e 's/xesam:artist: //p')
	echo "Paused - $artist"
else
    echo "$player_status"
fi
