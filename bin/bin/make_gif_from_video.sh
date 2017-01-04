#!/bin/bash
# source: http://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality/556031#556031

inputFile=$1

FPS=15
WIDTH=320

#Generate palette for better quality
ffmpeg -i $inputFile -vf fps=$FPS,scale=$WIDTH:-1:flags=lanczos,palettegen _tmp_palette.png

#Generate gif using palette
ffmpeg -i $inputFile -i _tmp_palette.png -loop 0 -filter_complex "fps=$FPS,scale=$WIDTH:-1:flags=lanczos[x];[x][1:v]paletteuse" output.gif

rm _tmp_palette.png
