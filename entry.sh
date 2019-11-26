#!/bin/sh

set -x
set -e

if [ -z "${USERNAME}" ]; then
  echo "You have to specify the -e USERNAME=... argument"
  exit
fi
if [ -z "${PASSWORD}" ]; then
  echo "You have to specify the -e PASSWORD=... argument"
  exit
fi

htpasswd -cb /etc/squid/passwd "${USERNAME}" "${PASSWORD}"

( socat tcp-listen:3128,reuseaddr,fork tcp:localhost:$PORT ) & exec $(which squid) -NYCd 1
