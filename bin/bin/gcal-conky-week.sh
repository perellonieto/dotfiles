#!/bin/sh

# FIXME: this method to shade the password
# in other file, shows the actual password
# when consulting the list of runing programs
gcalcli --pw=`cat ~/.gcalclirc-pw` --conky calw 2 |
    sed -e 's/(0\x71(B/─/g' \
        -e 's/(0\x78(B/│/g' \
        -e 's/(0\x6A(B/┘/g' \
        -e 's/(0\x6B(B/┐/g' \
        -e 's/(0\x6C(B/┌/g' \
        -e 's/(0\x6D(B/└/g' \
        -e 's/(0\x6E(B/┼/g' \
        -e 's/(0\x74(B/├/g' \
        -e 's/(0\x75(B/┤/g' \
        -e 's/(0\x76(B/┴/g' \
        -e 's/(0\x77(B/┬/g'

