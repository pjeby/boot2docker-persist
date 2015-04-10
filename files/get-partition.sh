#!/bin/sh
LABEL=boot2docker-data
BOOT2DOCKER_DATA=`blkid -o device -l -t LABEL=$LABEL`
PARTNAME=`echo "$BOOT2DOCKER_DATA" | sed 's/.*\///'`
echo -n $PARTNAME
