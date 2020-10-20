#!/bin/bash

action=${1:-"stop"}

echo $action

if [ $action = "stop" ]; then
    echo "Stop energy save"
    xset s off
    xset -dpms
    xautolock -disable
else
    echo "Start energy save"
    xset s on
    xset +dpms
    xautolock -enable
fi
