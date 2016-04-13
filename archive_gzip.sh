#!/bin/sh
echo 'Starting archive'
tar zcvf archives/`date +'%Y-%m-%d_%H-%M'`_filesystem.tar.gz filesystem.ext4
echo '>> Finish'
