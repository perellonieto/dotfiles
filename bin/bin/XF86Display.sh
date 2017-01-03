#!/bin/bash

PRI="LVDS1"
connectedOutputs=$(xrandr | grep " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/" | grep -v ${PRI})

EXT=${connectedOutputs[0]}

position='--right-of' # '--above' # --right-of

if [[ -z ${EXT// } ]]
then
    xrandr --auto
else
    xrandr --output $PRI --auto --primary --output $EXT --auto ${position} $PRI
fi
