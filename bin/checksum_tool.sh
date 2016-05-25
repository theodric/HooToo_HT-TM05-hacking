#!/bin/sh
#theodric 20160525
#this tool generates the checksum needed by the update script. 
#this is literally the function that does that directly from said script
#the checksum is of the entire firmware stub minus the top three lines of the file, the last of which contains the CRCSUM.
#So you have to assemble your firmware, run this to get the checksum, add the CRCSUM into the start_script.sh, and assemble again.

sed '1,3d' $0|cksum|sed -e 's/ /Z/' -e 's/   /Z/'|cut -dZ -f1
