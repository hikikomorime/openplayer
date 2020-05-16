#! /bin/bash

VBR="1500k"
FPS="24"
QUAL="superfast"

YOUTUBE_URL="rtmp://x.rtmp.youtube.com/live2"
KEY="KEY_OF_YOUR_STREAM"

VIDEO_SOURCE="/PATH_TO/yt-radio-cover.gif"
AUDIO_SOURCE="URL_OF_YOUR_MP3_STREAM"
NP_SOURCE=$(curl -s 'YOUR_AZURACAST_URL/api/nowplaying_static/NAME_OF_YOUR_RADIO.json' | jshon -e "now_playing" -e "song" -e "text")
FONT="/PATH_TO/overpass-regular.ttf"
NP_SONG="/PATH_TO/song.txt"

ffmpeg \
    -re -f lavfi -i "movie=filename=$VIDEO_SOURCE:loop=0, setpts=N/(FRAME_RATE*TB)" \
    -thread_queue_size 512 -i "$AUDIO_SOURCE" \
    -map 0:v:0 -map 1:a:0 \
    -map_metadata:g 1:g \
    -vf drawtext="fontsize=42: fontfile=$FONT: \
        box=0: boxcolor=black@0.5: boxborderw=20: \
        textfile=$NP_SONG: reload=1: fontcolor=white@0.8: x=50: y=th" \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale:v 3 -b:a 320000 -bufsize 512k \
    -f flv "$YOUTUBE_URL/$KEY"
