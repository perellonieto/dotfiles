#!/bin/bash

#convert ./*.png -gravity center -crop '!600x450+12+20' +repage new_gif.gif
#convert ./*.png -gravity center -crop '!600x440+0+0' \
#                 +repage +matte +map -resize 50% new_gif.gif
convert ./*.png -gravity center -crop '!600x440+0+0' \
                 +repage +matte +map new_gif.gif
