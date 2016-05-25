#!/bin/sh
mksquashfs $0 squished.fs -comp xz -b 131072
