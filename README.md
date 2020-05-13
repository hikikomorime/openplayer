# openplayer
YouTube livestream radio from icecast based system on your own dedicated server or VPS.

## Minimal requirements
I suggest you to use at least VPS with:

* 2 CPU (cores)
* 6 to 8GB RAM
* 50GB disk space

##  Installing AzuraCast (docker)
The easiest way to run your own radio on the dedicated server is to install [AzuraCast](https://www.azuracast.com "AzuraCast Homepage").

```shell
mkdir -p /var/azuracast
cd /var/azuracast
```
then
```shell
curl -fsSL https://raw.githubusercontent.com/AzuraCast/AzuraCast/master/docker.sh > docker.sh
chmod a+x docker.sh
./docker.sh install
```
you can also add Let's Encrypt SSL certificate
```shell
./docker.sh letsencrypt-create mydomain.example.com
```
