#!/bin/bash -x

if [ "$1" = "" ] ; then
  echo "Group NAME must be provided"
  echo "Usage: $0 NAME ID"
  exit 1
fi
if [ "$2" = "" ] ; then
  echo "Student ID (two digits) must be provided"
  echo "Usage: $0 NAME ID"
  exit 1
fi

group="$1"
student="$2"
sshport="${group}${student}22"
extport1="${group}${student}80"
extport2="${group}${student}81"
vpnport="${group}${student}90"
docker run \
        -d \
        --name "${group}-student${student}-L2-server" \
        --hostname "${group}-student${student}-L2-server" \
        -e TZ=Europe/Moscow \
        -p ${sshport}:22 \
        -p ${extport1}:${extport1} \
        -p ${extport2}:${extport2} \
        -p ${vpnport}:${vpnport} \
        --privileged vpn_server

# End of file