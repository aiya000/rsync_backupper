#!/bin/sh
if [ ! -f ./ubuntu_sync.ext4 ] ; then
	(
	echo 'rsync error'
	echo 'Please Exec neerest by this script directory'
	) 1>&2
	return 1
elif [ ! -s "$1" -o ! -f "$1" ] ; then
	echo 'select archived device file error' 1>&2
	return 1
fi

rm ./ubuntu_sync.ext4 && \
	tar zxvf "$1"
