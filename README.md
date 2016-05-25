#HooToo HT-TM05 hacking stuff and junk
####theodric's edition

See the thread on the OpenWRT forum for more information: https://forum.openwrt.org/viewtopic.php?id=61445

20160525:
* Updated Download-and-split script to grab the latest firmware file, and to use unrar rather than unzip since the archive type has changed. Also updated the relevant variable name to reflect. That's it.
* Added checksum script "checksum_tool.sh"
* Added mksquashfs script "squish.sh" for resquashing the unsquashfs'd rootfs file from initrdup/firmware/rootfs
* Removed the HooToo firmware to avoid possibly drawing their ire. It's available elsewhere. No need for a mirror here.

I have successfully unpacked, modified, repacked, and reflashed a firmware image with this workflow:

* Run Linux. OS X won't mount the initrdup ext2 image.
* Use Download-and-split.sh to grab and mount the latest firmware
* Use unsquashfs to unpack the firmware/rootfs file inside the initrdup somewhere outside the initrdup
* Make desired changes to the rootfs
* Use squish.sh to re-squashfs the rootfs file
* Replace the initrdup's firmware/rootfs file with your modified one
* sync and umount the initrdup
* gzip initrdup
* cat start_script.sh initrdup.gz > firmware_image_file
* checksum_tool.sh firmware_image.bin
* replace the CRCSUM value in start_script.sh with the one output by checksum_tool.sh
* once again, cat start_script.sh initrdup.gz > firmware_image_file
* flash the firmware_image_file onto your HT-TM05 using the regular web GUI
* hope that it doesn't brick it
* good luck

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
