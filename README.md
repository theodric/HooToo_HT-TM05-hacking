#HooToo HT-TM05 hacking stuff and junk
####theodric's edition

See the thread on the OpenWRT forum for more information: https://forum.openwrt.org/viewtopic.php?id=61445

20160525:
* Updated Download-and-split script to grab the latest firmware file, and to use unrar rather than unzip since the archive type has changed. Also updated the relevant variable name to reflect. That's it.
* Added checksum script "checksum_tool.sh"
* Added mksquashfs script "squish.sh" for resquashing the unsquashfs'd rootfs file from initrdup/firmware/rootfs
* Removed the HooToo firmware to avoid possibly drawing their ire. It's available elsewhere. No need for a mirror here.

I have successfully unpacked, modified, repacked, and reflashed a firmware image with this workflow:

1 Run Linux, because OS X won't mount the initrdup ext2 image
2 Install the squashfs tools package appropriate to your distribution
3 Use Download-and-split.sh to grab and mount the latest firmware
4 Use unsquashfs to unpack the firmware/rootfs file inside the initrdup somewhere outside the initrdup
5 Make desired changes to the rootfs
6 Use squish.sh to re-squashfs the rootfs file
7 Replace the initrdup's firmware/rootfs file with your modified one
8 sync and umount the initrdup
9 gzip initrdup
10 cat start_script.sh initrdup.gz > firmware_image_file
11 checksum_tool.sh firmware_image.bin
12 replace the CRCSUM value in start_script.sh with the one output by checksum_tool.sh
13 once again, cat start_script.sh initrdup.gz > firmware_image_file
14 flash the firmware_image_file onto your HT-TM05 using the regular web GUI
15 hope that it doesn't brick it
16 glhf

#TODO 20160530
* figure out how much space I actually have to work with in each of the MTD partitions so I don't cause myself problems
* implement automatic pull-in of optware or entware on either an ext2 USB flash drive or (better?) a loop-mounted ext2 fs image on a *FAT/NTFS-formatted disk
* make an /etc/profile part of the default image
* no really totally actually make a /root directory that's at least somewhat writeable (tmpfs? symlink to /etc/root?)
* various cleanups and assorted whatnots

####I found a couple other interesting projects that are relevant to the OS running on the HT-TM05
https://github.com/wingspinner/Tripmate-HT-TM02-Telnet-Enabling
https://github.com/digidem/filehub-config/blob/master/README.md

------------------------------------------------------------------------------------------------------------------------------------
What follows below is a portion of the original readme from cryptographrix's repo, where the Download-and-split.sh script came from.
See: https://github.com/cryptographrix/HooToo_HT-TM05-hacking

## cryptographrix/HooToo_HT-TM05-hacking

### Summary

This repo contains a basic script that downloads the current firmware for the HooToo HT-TM05 portable router and lets you access and modify everything.

## What this actually does

1. Downloads the firmware zip file from the HooToo download site (ZIP)
2. Unzips that into the actual update file, which is a stub of sh and initrdup.gz (UPDATE)
3. Splits the UPDATE file into start_script.sh and initrdup.gz
4. Gunzips initrdup.gz into initrdup
5. Creates ./mount and...
6. Mounts initrdup into ./mount

### QnA

#### Who cares?

Anyone that bought one of these useful portable linux systems and wants to do more with - or customize - it.

#### What can you do from here?

Anything you want - eventually you'll need to reverse the process:

1. sync and unmount initrdup
2. gzip initrdup
3. cat start-script.sh initrdup.gz > fw_...
4. zip fw into HooToo....
