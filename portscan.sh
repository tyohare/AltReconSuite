#!/bin/bash

if [ -z "$1" ]
then
    echo "Please provide an IP address as the first argument of the program"
    exit 1
fi

IP=$1

echo "Scanning all ports on $IP for open ports..."

for port in {1..65535}; do
  (echo >/dev/tcp/$IP/$port) &>/dev/null && echo "$port is open"
done
