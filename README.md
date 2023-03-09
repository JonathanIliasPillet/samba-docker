# samba-docker

This container is a simple way to wrap a Debian Samba server.

## Example of use

There is a example of `docker-compose.yml` where you can see that smb.conf is provided via a volume.

According to the path given in this configuration, you should provide a `conf/smb.conf` file, where you can put the configuration you want. Of course, you can change `docker-compose.yml` to use another config file path.

In the example, `/data/videotheque` is a host directory that I want to share. There is a corresponding entry in `smb.conf`.

## Future improvments

I think about adding a wireguard client into the container. Thus it will be easy to provide many samba servers in differents VPN.
