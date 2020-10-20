#!/bin/bash
INPUT_DEVICE="'Capture'"
if amixer sget $INPUT_DEVICE,0 | grep '\[on\]' ; then
    amixer sset $INPUT_DEVICE,0 toggle
    #echo "0 blink" > /proc/acpi/ibm/led
    DISPLAY=":0.0" notify-send -t 1000 -i microphone-sensitivity-muted-symbolic "Mic MUTED"
else
    amixer sset $INPUT_DEVICE,0 toggle                       
    DISPLAY=":0.0" notify-send -t 1000 -i microphone-sensitivity-high-symbolic "Mic ON"
    #echo "0 on" > /proc/acpi/ibm/led 
fi

