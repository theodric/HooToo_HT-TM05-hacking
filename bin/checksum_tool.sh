#!/bin/sh
#theodric 20160525
#this tool generates the checksum needed by the update script. 
#this is literally the function that does that directly from said script
#the checksum is of the entire firmware stub, including the line that contains the expected CRCSUM value.
#Seems like a chicken-egg problem to me.
#my brain hurts now
#halp

sed '1,3d' $0|cksum|sed -e 's/ /Z/' -e 's/   /Z/'|cut -dZ -f1
