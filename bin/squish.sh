#!/bin/sh
#creates squashfs file for HT-TM05 with correct compression and block size
#usage: squish.sh /path/to/source/filesystem output.filename
mksquashfs $1 $2 -comp xz -b 131072
