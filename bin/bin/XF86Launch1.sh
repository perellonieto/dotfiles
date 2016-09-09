#!/bin/bash

#declare -a arr=("Do not push this button!"
#                "Don't do that!"
#                "Come on!"
#                "Stop!"
#                "Please"
#                "It hurts!"
#                "Don't be mean."
#                `date +"It is %R"`)
#
#expression=${arr[$RANDOM % ${#arr[@]} ]}
#
#echo "${expression}" | espeak -ven-us+f4 -s170

declare -a arr=("beep"
                "bop")

expression=${arr[$RANDOM % ${#arr[@]} ]}

pitch=$((1 + RANDOM % 99))

echo "${expression}" | espeak -p $pitch
