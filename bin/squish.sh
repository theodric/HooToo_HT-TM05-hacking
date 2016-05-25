#!/bin/sh
#creates squashfs file for HT-TM05 with correct compression and block size
#usage: squish.sh /path/to/source/filesystem output.filename
echo path is $1
echo filename is $2

mksquashfs $1 $2 -comp xz -b 131072
