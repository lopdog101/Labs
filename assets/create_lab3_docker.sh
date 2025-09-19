#!/bin/bash -x

if [ "$1" = "" ] ; then
  echo "NAME must be provided"
  echo "Usage: $0 NAME ID"
  exit 1
fi
if [ "$2" = "" ] ; then
  echo "PORT must be provided"
  echo "Usage: $0 NAME ID"
  exit 1
fi

name="$1"
port="$2"
docker run -d --name "${name}" -p ${port}:3000 bkimminich/juice-shop

# End of file
