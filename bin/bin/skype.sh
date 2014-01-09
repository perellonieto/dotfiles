#!/bin/bash
#
# script preloads the 32 bit video for linux (v4l) libs needed by 64 bit skype
#
# Wayno Guerrini http://www.pkill-9.com v 2.0

# added the export for the gtk 32 bit library -- GU -6/22/2012
#
#export GTK_PATH="/usr/lib/python2.7/dist-packages/gtk-2.0"

 LD_PRELOAD=/usr/lib/i386-linux-gnu/libv4l/v4l1compat.so /usr/bin/skype
