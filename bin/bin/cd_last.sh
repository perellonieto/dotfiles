#!/usr/bin/env bash
# FIXME this can not be done as the process goes to the specified folder but
# not the original shell process

function show_usage() {
    echo "Usage: $0" 1>&2;
}

function show_help() {
    echo "Usage: $0" 1>&2;
}


if [ $# -gt 1 ]
then
    show_usage
    exit 1
fi

current_dir=`pwd`
last_dir=`ls -td ${current_dir}/*/ | head -1`
cd ${last_dir}
