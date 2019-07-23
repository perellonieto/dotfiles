#!/bin/bash

PRI="LVDS1"
#EXT="VGA1"
EXT="HDMI1"

position='--right-of' # '--above' # --right-of

#xrandr  --output $PRI --auto --primary
#xrandr  --output $EXT --auto ${position} $PRI
xrandr --output $PRI --auto --primary --output $EXT --auto ${position} $PRI
