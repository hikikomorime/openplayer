#!/bin/bash
while true; do
# define json from which you will take the current song title
SONG_TITLE=$(curl -s 'https://YOUR_AZURACAST_URL/api/nowplaying_static/NAME_OF_YOUR_RADIO.json' | jshon -e "now_playing" -e "song" -e "title")

echo $SONG_TITLE | tee song.txt

  sleep 5;
done
