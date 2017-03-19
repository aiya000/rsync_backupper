# rsync_backupper
The backup and restore tool for the whole of your filesystem :+1:

# Requirements
- rsync
- sudo
- tar


# How to use

- `{...}` can be choice as some path by you

## Prepare

1. git clone this in a sufficiently large device
    - `git clone https://github.com/aiya000/rsync_backupper {backupper-path} && cd {backupper-path}`
2. mount a device file which is backup target
    - `mount /dev/foo {bar-path} && cd {bar-path}`
3. Create a file of empty loopback device
    - `dd if=/dev/zero of=filesystem.dev bs=800M count=100`
    - filesystem.dev must be bigger than `/dev/foo`
4. Create the filesystem
    - `mkfs -t ext4 filesystem.dev`
    - I recommend ext4 but you may can choice your favorite format
5. Modify exclude.txt for your environment <a name="modify-exclude-txt"></a>
    - exclude.txt is read by backup.sh
    - You must add {backupper-path} to it
6. Modify restore.sh for your environment
    - TODO: Depend outer file

## Backup

1. Run `./backup.sh`
    - or `source backup.sh` if running is denied

## Restore

1. Run `./restore.sh`
    - or `source restore.sh` if running is denied

## Notice
Don't forget to [add here to exclude.txt](#modify-exclude-txt) !  
If you forgot this, backing up is never finished :cry:


# TODO

- Don't require sudo ( require from user side )
