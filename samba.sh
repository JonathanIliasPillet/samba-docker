#!/usr/bin/env bash
if [ ! -z "$WG_CONF_NAME" ] ; then
	wg-quick up $WG_CONF_NAME
fi
exec ionice -c 3 smbd -FS --no-process-group </dev/null
