#!/bin/bash

current_workspaces=($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -n))
printf "%s\n" "${current_workspaces[@]}"

new_workspace=0
for i in {1..100}
do
    found=0
    for e in "${current_workspaces[@]}"; do
        if [ "$i" == "$e" ]; then
            found=1
            break
        fi
    done
    if [ $found -eq 0 ]; then
        new_workspace=$i
        break
    fi
done

i3-msg workspace $new_workspace
i3-msg exec dmenu_run
