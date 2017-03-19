#!/bin/sh
if [ ! -f ./filesystem.dev ] ; then
	echo 'rsync error' 1>&2
	echo 'Please Exec neerest by this script directory' 1>&2
	exit 1
fi

sudo mount -o loop,rw filesystem.dev mnt ; wait

sudo rsync -avh --delete ./mnt/bin/           /bin
sudo rsync -avh --delete ./mnt/etc/           /etc
sudo rsync -avh --delete ./mnt/home/          /home
sudo rsync -avh --delete ./mnt/lib/           /lib
sudo rsync -avh --delete ./mnt/lib64/         /lib64
sudo rsync -avh --delete ./mnt/opt/           /opt
sudo rsync -avh --delete ./mnt/root/          /root
sudo rsync -avh --delete ./mnt/sbin/          /sbin
sudo rsync -avh --delete ./mnt/srv/           /srv
sudo rsync -avh --delete ./mnt/usr/           /usr
sudo rsync -avh --delete ./mnt/var/           /var
sudo rsync -avh --delete ./mnt/vmlinuz        /vmlinuz.old
sudo rsync -avh --delete ./mnt/vmlinuz.old    /vmlinuz.old
sudo rsync -avh --delete ./mnt/initrd.img     /initrd.img
sudo rsync -avh --delete ./mnt/initrd.img.old /initrd.img.old
wait

sudo umount mnt
