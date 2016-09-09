#!/bin/bash

PRI="LVDS1"
EXT="VGA1"
position='--right-of' # '--above' # --right-of

if (xrandr | grep "${EXT} connected" > /dev/null)
then
    echo "${EXT} connected"
    xrandr --output $PRI --auto --primary --output $EXT --auto ${position} $PRI
else
    echo "${EXT} not connected"
    xrandr --auto
fi
