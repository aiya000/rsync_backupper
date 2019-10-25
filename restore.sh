#!/bin/sh

if [[ -z $1 ]] ; then
    echo 'Please specify mounted path.'
    echo 'e.g. ./restore.sh /mnt'
fi
restore_root=$1

#!/bin/bash
if [ ! -f ./filesystem.dev ] ; then
    echo 'rsync error' 1>&2
    echo 'Please Exec neerest by this script directory' 1>&2
    exit 1
fi

(
sudo mount -o loop,rw filesystem.dev mnt ; wait

sudo rsync -avh --delete ./mnt/bin/           "$restore_root/bin"
sudo rsync -avh --delete ./mnt/etc/           "$restore_root/etc"
sudo rsync -avh --delete ./mnt/home/          "$restore_root/home"
sudo rsync -avh --delete ./mnt/lib/           "$restore_root/lib"
sudo rsync -avh --delete ./mnt/lib64/         "$restore_root/lib64"
sudo rsync -avh --delete ./mnt/opt/           "$restore_root/opt"
sudo rsync -avh --delete ./mnt/root/          "$restore_root/root"
sudo rsync -avh --delete ./mnt/sbin/          "$restore_root/sbin"
sudo rsync -avh --delete ./mnt/srv/           "$restore_root/srv"
sudo rsync -avh --delete ./mnt/usr/           "$restore_root/usr"
sudo rsync -avh --delete ./mnt/var/           "$restore_root/var"
sudo rsync -avh --delete ./mnt/vmlinuz        "$restore_root/vmlinuz.old"
sudo rsync -avh --delete ./mnt/vmlinuz.old    "$restore_root/vmlinuz.old"
sudo rsync -avh --delete ./mnt/initrd.img     "$restore_root/initrd.img"
sudo rsync -avh --delete ./mnt/initrd.img.old "$restore_root/initrd.img.old"
) | tee restore.log

wait

sudo umount mnt
