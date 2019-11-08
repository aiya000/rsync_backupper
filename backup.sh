#!/bin/bash
if [ ! -f ./filesystem.dev ] ; then
    echo 'Please make ./filesystem.dev and ext4 first.'
    exit 1
fi

sudo mount -o loop,rw filesystem.dev mnt

sudo rsync \
    --exclude-from ./exclude.txt \
    -avhAX --delete / ./mnt \
        | tee ./backup.log

sudo umount mnt
