#!/bin/bash
while true; do
# define json from which you will take the current song title
SONG_TITLE=$(curl -s 'https://YOUR_AZURACAST_URL/api/nowplaying_static/NAME_OF_YOUR_RADIO.json' | jshon -e "now_playing" -e "song" -e "title")

# do not change this
echo $SONG_TITLE | tee song.txt

# script will run in loop - 5 seconds
  sleep 5;
done
