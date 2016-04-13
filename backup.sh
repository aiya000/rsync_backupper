#!/bin/sh
if [ ! -f ./filesystem.ext4 ] ; then
	echo 'rsync error' 1>&2
	echo 'Please Exec neerest by this script directory' 1>&2
	exit 1
fi

sudo mount -t ext4 -o loop,rw filesystem.ext4 mnt \
	&& sudo rsync \
		--exclude-from ./exclude.txt \
		-va --delete / mnt/

sudo umount mnt
