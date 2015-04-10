#!/bin/sh
LABEL=boot2docker-data
BOOT2DOCKER_DATA=`blkid -o device -l -t LABEL=$LABEL`
PARTNAME=`echo "$BOOT2DOCKER_DATA" | sed 's/.*\///'`

echo "Restoring backup from $PARTNAME"
/usr/bin/filetool.sh -r $PARTNAME

echo "Configuring packages directory"
mkdir -p /mnt/$PARTNAME/tce/optional
rm -rf /tmp/tce
ln -sf /mnt/$PARTNAME/tce /tmp/tce

echo "Loading packages configured as 'onboot'"
sudo -u docker tce-load -i $(cat /tmp/tce/onboot.lst)
