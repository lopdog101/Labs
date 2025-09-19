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
vpnport="${group}${student}90"
docker run \
        -d \
        --name "${group}-student${student}-L2-client" \
        --hostname "${group}-student${student}-L2-client" \
        -e TZ=Europe/Moscow \
        -p ${sshport}:22 \
        -p ${vpnport}:${vpnport} \
        --privileged takeyamajp/ubuntu-sshd

# End of file