FROM debian:bullseye-slim

# inspiration : https://github.com/dperson/samba

LABEL org.opencontainers.image.authors="Jonathan Ilias-Pillet <ismael@chouppy.net>"

ENV LANG fr_FR.utf8

ARG DEBIAN_FRONTEND=noninteractive

RUN \
apt-get update && \
apt-get install -y tini && \
apt-get install -y locales tzdata && \
localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8 && \
apt-get install -y samba smbclient smbldap-tools winbind samba-dsdb-modules samba-vfs-modules && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* 

EXPOSE 137/udp 138/udp 139 445

HEALTHCHECK --interval=60s --timeout=15s \
  CMD smbclient -L \\localhost -U % -m SMB3

VOLUME ["/var/cache/samba", "/var/lib/samba", "/var/log/samba", "/run/samba"]

COPY samba.sh /usr/bin

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/bin/samba.sh"]

