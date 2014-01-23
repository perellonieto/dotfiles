#!/bin/sh

# FIXME: this method to shade the password
# in other file, shows the actual password
# when consulting the list of runing programs
gcalcli --pw=`cat ~/.gcalclirc-pw` --conky agenda
