#!/bin/sh
if [ ! -f ./ubuntu_sync.ext4 ] ; then
	(
	echo 'rsync error'
	echo 'Please Exec neerest by this script directory'
	) 1>&2
	return 1
fi

sudo mount -t ext4 -o loop,rw ubuntu_sync.ext4 mnt ; wait

sudo rsync -va --delete \
	./mnt/bin/ /bin     ;
sudo rsync -va --delete \
	./mnt/etc/ /etc     ;
sudo rsync -va --delete \
	./mnt/home/ /home   ;
sudo rsync -va --delete \
	./mnt/lib/ /lib     ;
sudo rsync -va --delete \
	./mnt/lib64/ /lib64 ;
sudo rsync -va --delete \
	./mnt/opt/ /opt     ;
sudo rsync -va --delete \
	./mnt/root/ /root   ;
sudo rsync -va --delete \
	./mnt/sbin/ /sbin   ;
sudo rsync -va --delete \
	./mnt/srv/ /srv     ;
sudo rsync -va --delete \
	./mnt/usr/ /usr     ;
sudo rsync -va --delete \
	./mnt/var/ /var     ;
sudo rsync -va --delete \
	./mnt/vmlinuz /vmlinuz.old;
sudo rsync -va --delete \
	./mnt/vmlinuz.old /vmlinuz.old;
sudo rsync -va --delete \
	./mnt/initrd.img /initrd.img;
sudo rsync -va --delete \
	./mnt/initrd.img.old /initrd.img.old;
wait

sudo umount mnt
