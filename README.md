# rsync_backupper

## About

This is rsync backup and restore tools for Linux filesystems.

* Require tool
  - rsync
  - sudo
  - tar


## Steps

### Preparation for Backup and Restore

1. `$ mount /dev/foo /path/ignored/dir && cd /path/ignored/dir`
  - /dev/foo isn't backup target filesystem
2. `$ git clone https://github.com/aiya000/rsync_backupper.git Backup && cd Backup`
3. `$ dd if=/dev/zero of=filesystem.ext4 bs=800M count=100`
  - You can choice bs value and count value for target filesystem
4. `$ mkfs -t ext4 filesystem.ext4`

### How to Backup filesystem

`$ ./backup.sh`  
or  
`$ source backup.sh` (if `/dev/foo` deny directly execute script)

### How to Restore filesystem

`$ ./restore.sh`  
or  
`$ source restore.sh` (if `/dev/foo` deny directly execute script)


## Configuration

You can edit ./exclude.txt .  
The exclude.txt contains paths excluded on the backup.

## Notice

This directory must not be put `filesystem.ext4` to target filesystem.  
( We use care recursive backup )

### Examples

1. `$ cd ~ && git clone https://github.com/aiya000/rsync_backupper.git Backup && cd Backup`
2. `$ dd if=/dev/zero of=filesystem.ext4 bs=800M count=100 && mkfs -t ext4 filesystem.ext4`
3. `$ ./backup.sh`
  - recursively backup

1. `$ mount /dev/foo /home/user/backup && cd /home/user/backup/Backup`
2. `$ ./backup.sh`
  - recursively backup

- - -

## TODO

- Don't require sudo ( require from user side )

- - -

author: aiya000  
since:  2014-04 ?  
英語おかしかったら教えてください。
あ、全部おかしいですね :)
