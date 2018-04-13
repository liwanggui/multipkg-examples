#!/bin/bash
##
## clean_trash.sh
## Clean up the files in the trash can to prevent it from occupying too much hard disk space.
## Write by wglee
##
## Started on April 13, 2018 10:22
## Last update April 13, 2018 10:22
##

## trashbin definitions
# this is the same for newer KDE and GNOME:
trash_desktops="$HOME/.local/share/Trash/files"
# if neither is running:
trash_fallback="$HOME/.Trash"

day=$1

if [[ -z "$day" ]]; then
    day=15
fi

# if it is not a number
if ! grep '^[[:digit:]]*$' <<< "$day" &> /dev/null;then
    echo "The specified number of days is invalid. Please enter a valid number."
    exit 1
fi


if [[ -d "$trash_desktops" ]]; then
    find "$trash_desktops" -ctime +"$day" -exec rm -fr {} \;
fi


if [[ -d "$trash_fallback" ]]; then
    find "$trash_fallback" -ctime +"$day" -exec rm -fr {} \;
fi
