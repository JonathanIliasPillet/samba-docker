# samba-docker

This container is a simple way to wrap a Debian Samba server.

## Example of use

There is a example of `docker-compose.yml` where you can see that smb.conf is provided via a volume.

According to the path given in this configuration, you should provide a `conf/smb.conf` file, where you can put the configuration you want. Of course, you can change `docker-compose.yml` to use another config file path.

In the example, `/data/videotheque` is a host directory that I want to share. There is a corresponding entry in `smb.conf`.

## Using Wireguard endpoint

By setting `WG_CONF_NAME` environment, you can choose to setup a wireguard client interface (wg-quick setup format) before launching samba. If environment is left empty or doesn't exist, no wireguard setup is done.

If set, the configuration file must be provided via a volume in `/etc/wireguard` directory as in the `docker-compose.yml` example. The config file name and the name given in `WG_CONF_NAME` environment variable must match as wg-quick requires the name and the config file matches.

