#!/bin/bash

convert ./*.png -gravity center -crop '!600x450+12+20' +repage new_gif.gif
