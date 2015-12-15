#!/bin/sh
if [ ! -f ./ubuntu_sync.ext4 ] ; then
	(
	echo 'rsync error'
	echo 'Please Exec neerest by this script directory'
	) 1>&2
	return 1
fi

sudo mount -t ext4 -o loop,rw ubuntu_sync.ext4 mnt && \
	sudo rsync \
		--exclude-from ./exclude.txt \
		-va --delete / mnt/

sudo umount mnt
