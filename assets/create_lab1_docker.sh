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
extport="${group}${student}22"
docker run -d --name "${group}-student${student}-L1" -e TZ=Europe/Moscow -p ${extport}:22 takeyamajp/ubuntu-sshd

# End of file
