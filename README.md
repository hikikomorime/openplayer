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

## Get your scripts from this repository

### livestream.sh

```shell
# set the quality of your stream here
VBR="1500k"
FPS="24"
QUAL="superfast"
```
