#!/bin/sh
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
#         NOTES:  ---
#        AUTHOR:  Miquel Perello Nieto, perello.nieto@gmail.com
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  02/07/2024 09:52:01 BST
#      REVISION:  ---
#===============================================================================

currentedid=`xrandr --prop | grep -A2 EDID`
echo "Current display edid"
echo $currentedid
echo

filenamelist=`ls ~/.screenlayout/*.txt`
for filename in $filenamelist
do
   echo "Checking edid of $filename\n"
   edid=`cat $filename`
   echo $edid
   if [ "$currentedid" = "$edid" ]; then
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
