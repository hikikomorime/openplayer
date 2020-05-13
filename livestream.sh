#! /bin/bash

# set the quality of your stream here
VBR="1500k"
FPS="24"
QUAL="superfast"

# youtube livestream settings
YOUTUBE_URL="rtmp://x.rtmp.youtube.com/live2"
KEY="key_of_your_stream"

# set the cover of the livestream
VIDEO_SOURCE="/path_to/livestream_cover.gif"
AUDIO_SOURCE="https://stream_address/filename.mp3"

ffmpeg \
  -re -f lavfi -i ""
