#!/bin/sh
echo 'Starting archive'
tar jcvf archives/`date +'%Y-%m-%d'`_ubuntu_sync.tar.bz2 ubuntu_sync.ext4
echo '>> Finish'
