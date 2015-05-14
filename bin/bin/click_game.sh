#!/bin/bash

xdotool mousemove --sync 600 400
for i in {1..2000}
do
    xdotool click 1
    echo $i
    sleep 0.01
done
