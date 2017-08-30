#!/bin/sh
backup_root=$HOME/mnt

if [ ! -f ./filesystem.dev ] ; then
	echo 'rsync error' 1>&2
	echo 'Please Exec neerest by this script directory' 1>&2
	exit 1
fi

sudo mount -o loop,rw filesystem.dev mnt \
	&& sudo rsync \
		--exclude-from ./exclude.txt \
		-avh --delete "$backup_root" mnt/

sudo umount mnt
