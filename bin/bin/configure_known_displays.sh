#!/usr/bin/env bash
#===============================================================================
#
#          FILE:  configure_known_displays.sh
#
#         USAGE:  ./configure_known_displays.sh
#
#   DESCRIPTION: Checks the Extended Display Identification Data (EDID) of the 
#                connected displays and compares with the ones stored in the
#                folder ~/.screenlayout/ with txt extension. If an equal match
#                is found, it tries to execute a script with the same name than
#                the txt file from the same folder. For example
#                "home_samsung.txt" will be matched with "home_samsung.sh".
#                The content of "home_samsung.txt" was obtained with the
#                command "xrandr --prop | grep -A2 EDiD > home_samsung.txt".
#                The configuration script was created with arandr.
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  Version 1.1 fixed issue with the order of the screens
#        AUTHOR:  Miquel Perello Nieto, perello.nieto@gmail.com
#       COMPANY:  ---
#       VERSION:  1.1
#       CREATED:  02/07/2024 09:52:01 BST
#      REVISION:  11/07/2024 11:22:01 BST
#         TODOS:  - Add option to save current configuration.
#===============================================================================

configfolder="${HOME}/.screenlayout"

version="$0 1.1
Copyright (C) 2024
This is free software.  You may redistribute copies of it under the terms of
the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.
There is NO WARRANTY, to the extent permitted by law.

Written by Miquel Perello Nieto."


usage="Usage: $0 [OPTION]
Configures the connected displays based on previously saved configurations for
the currently connected screens.

    OPTIONs

     -h, --help       Show the help
     -v, --version    Show the version
     -s, --save       WARNING: Under development. Save current configuration
     -l, --list       List all the files in the configuration folder
"

Save()
{
    echo "WARNING: This option is under development"
    echo "Saving current configuration in ${configfolder}/${configname}.txt"
}


while [[ $# -gt 0 ]]; do
    option="$1"
    shift
    case "$option" in
    -h|-\?|--help) printf '%s\n' "${usage}" || exit 2; exit;;
    -v|--version) printf '%s\n' "$version" || exit 2; exit;;
    -l|--list) ls -l "${configfolder}/" || exit 2; exit;;
    -s|--save) configname=$1; Save || exit 2; exit;;
    *)
      printf '%s\n' "${usage}" || exit 2; exit;
      ;;
    esac
done

currentedid=`xrandr --prop | grep -A2 EDID`
echo "Current display edid"
echo $currentedid
echo
sortedcurrentedid=$(echo "$currentedid" | sort)

filenamelist=`ls "${configfolder}/"*.txt`
for filename in $filenamelist
do
   echo "Checking edid of $filename\n"
   edid=`cat $filename`
   echo $edid
   sortededid=$(echo "$edid" | sort)
   if [ "$sortedcurrentedid" = "$sortededid" ]; then
       echo "Current EDID coincides"
       echo "Searching corresponding configuration file"
       configfile="${filename%.*}.sh"
       echo "Checking if $configfile exists"
       if [ -e "$configfile" ]; then
           echo "The configuration file exists"
           echo "Loading configuration file"
           exec $configfile && exit 1
       else
           echo "The configuration file does not exist"
       fi
   else
       echo "Does not coincide"
   fi
done

echo "No configuration found, setting automatic configuration"
echo "xrandr --auto"
xrandr --auto
