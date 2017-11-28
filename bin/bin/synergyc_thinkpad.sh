#!/bin/sh

SESSION_NAME="synergyc"

command1='synergyc -f localhost:8081'
command2='ssh -N -L 8081:localhost:8081 mp15688@it064753.users.bris.ac.uk'

tmux has-session -t ${SESSION_NAME}

if [ $? != 0 ]
then
    echo "Creating ssh tunnel"
    tmux new-session -d -s ${SESSION_NAME} -n window0 -d

    tmux send-keys -t ${SESSION_NAME} "${command1}" C-m

    tmux split-window -h -t ${SESSION_NAME}
    echo "Creating synergy client"
    tmux send-keys -t ${SESSION_NAME} "${command2}" C-m
fi
tmux attach -t ${SESSION_NAME}
