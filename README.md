# OpenPlayer Youtube LiveStream
YouTube livestream radio from icecast based system on your own dedicated server or VPS.

## Minimal requirements
I suggest you to use at least VPS with:

* 2 CPU (cores) 2GHz (the more the better)
* 8GB RAM (the more the better)
* 50GB disk space (should be fine)

System I have tested this out:
Ubuntu 20.04 LTS

##  Installing AzuraCast (docker)
The easiest way to run your own radio on the dedicated server is to install [AzuraCast](https://www.azuracast.com "AzuraCast Homepage").

```bash
mkdir -p /var/azuracast
cd /var/azuracast
```
then
```bash
curl -fsSL https://raw.githubusercontent.com/AzuraCast/AzuraCast/master/docker.sh > docker.sh
chmod a+x docker.sh
./docker.sh install
```
you can also add Let's Encrypt SSL certificate
```bash
./docker.sh letsencrypt-create mydomain.example.com
```
## Install FFMPEG

You can use basic ffmpeg 3.x

First run update
```shell
sudo apt update
```
then install the application
```shell
sudo apt install ffmpeg
```

To install ffmpeg 4.x you can use snap
```shell
sudo snap install ffmpeg
```

## Start your stream

Go to your youtube account and

## Get your scripts from this repository and configure

### livestream.sh

```shell
# set the quality of your stream here
VBR="1500k"
FPS="24"
QUAL="superfast"
```

```shell
# youtube livestream settings
YOUTUBE_URL="rtmp://x.rtmp.youtube.com/live2"
KEY="KEY_OF_YOUR_STREAM"
```

You should be able to get your stream key from the active live stream on your Youtube Studio.

Just click on the eye icon to reveal it

![get your stream key here](https://i.imgur.com/0XWtKO5.jpg "Get your stream key here")

...next

```shell
# point the script to your cover gif file
VIDEO_SOURCE="/PATH_TO/livestream_cover.gif"
# enter here the URL to your icecast MP3 stream
AUDIO_SOURCE="URL_OF_YOUR_MP3_STREAM"
```

...set font and the source of song titles

```shell
FONT="/PATH_TO/overpass-regular.ttf"
NP_SONG="/PATH_TO/song.txt"
```

..optionally (only if you wish to use text variable in ffmpeg)

```shell
NP_SOURCE=$(curl -s 'https://YOUR_AZURACAST_URL/api/nowplaying_static/NAME_OF_YOUR_RADIO.json' | jshon -e "now_playing" -e "song" -e "text")
```

## Additional files included

Overpass font - overpass-regular.ttf

Youtube stream cober - livestream_cover.gif
