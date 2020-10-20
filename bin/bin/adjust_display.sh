#!/bin/bash

version="XF86Display.sh 0.2
Copyright (C) 2017
This is free software.  You may redistribute copies of it under the terms of
the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.
There is NO WARRANTY, to the extent permitted by law.

Written by Miquel Perello Nieto."

usage="Usage: $0 [OPTION]
Automatically adjustes an externally connected monitor.

    OPTIONs

     -h, --help       Show the help
     -v, --version    Show the actual version information
     -p, --position   Position of the external screen (--left-of, --right-of,
                      --above, --below)
     -r, --rotation   Rotation of the external screen (normal, left, right or
                      inverted)

Report bugs to <perello.nieto@gmail.com>."
PRI="LVDS-1"

connectedOutputs=$(xrandr | grep " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/" | grep -v ${PRI})

EXT=${connectedOutputs[0]}

position='--left-of' # '--above' # --right-of
rotation='normal'

while [[ $# -gt 0 ]]; do
    opt="$1"
    shift
    case "$opt" in
    -h|-\?|--help) printf '%s\n' "${usage}" || exit 2; exit;;
    -v|--version) printf '%s\n' "$version" || exit 2; exit;;
    -p|--position) position=$1; shift;;
    -r|--rotation) rotation=$1; shift;;
    *)
      if [[ $# -eq 0 ]]; then
          diary=${opt}
      else
          printf '%s\n' "${usage}" || exit 2; exit;
      fi
      ;;
    esac
done

if [[ -z ${EXT// } ]]
then
    xrandr --auto
else
    echo "Position = ${position}"
    echo "Rotation = ${rotation}"
    xrandr --output $PRI --auto --primary --output $EXT --rotate ${rotation} --auto ${position} $PRI
fi
