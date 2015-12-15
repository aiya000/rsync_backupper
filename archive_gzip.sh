#!/bin/sh
echo 'Starting archive'
tar zcvf archives/`date +'%Y-%m-%d_%H-%M'`_ubuntu_sync.tar.gz ubuntu_sync.ext4
echo '>> Finish'
