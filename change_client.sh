#!/bin/bash

function invalid_args() {
	echo "Usage: ./change_client.sh [CLIENT_IP] [CLIENT_PORT]" >&2
	exit 1
}

function set_ip_and_port() {
	sed -i "s|.*# define CLIENT_IP (char\*)\".*\".*|# define CLIENT_IP (char\*)\"$1\"|g" $3
	sed -i "s|.*# define CLIENT_PORT (int).*|# define CLIENT_PORT (int)$2|g" $3
}

if [[ -z $1 ]] || [[ -z $2 ]] || [[ $3 ]]; then
	invalid_args
fi

set_ip_and_port $1 $2 linux.c
set_ip_and_port $1 $2 windows.c

echo "Done!"
exit 0
