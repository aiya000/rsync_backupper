#!/bin/sh
echo 'Starting archive'
tar jcvf archives/`date +'%Y-%m-%d'`_filesystem.tar.bz2 filesystem.ext4
echo '>> Finish'
