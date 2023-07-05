#!/bin/bash

# Function to increase volume by 10%
increase_volume_10() {
    bash vup.sh
}

# Function to increase volume by 50%
increase_volume_50() {
    bash vdwn.sh
}

# Function to increase volume by 100%
increase_volume_100() {
    pactl list | grep -oP 'Sink #\K([0-9]+)' | while read -r i ; do pactl -- set-sink-volume $i 100% ; done
    bash main.sh
}

# Function to increase volume by 150%
increase_volume_150() {
    pactl list | grep -oP 'Sink #\K([0-9]+)' | while read -r i ; do pactl -- set-sink-volume $i 0% ; done
    bash main.sh
}

# Quit
return_to_main() {
    clear | exit
    clear
}

# Dialog menu options
options=(
    1 "Vol Up"
    2 "Vol Down"
    3 "Zero at 100%"
    4 "Mute"
    5 "Exit"
)

# Dialog menu title
title="Sound Wizard"

# Dialog menu width and height
height=12
width=40

# Display the dialog menu and capture the user's choice
choice=$(dialog --clear --backtitle "$title" --title "$title" --menu "Please select an option:" $height $width 0 "${options[@]}" 2>&1 >/dev/tty)

# Execute the corresponding function based on the user's choice
case "$choice" in
    1)
        increase_volume_10
        ;;
    2)
        increase_volume_50
        ;;
    3)
        increase_volume_100
        ;;
    4)
        increase_volume_150
        ;;
    5)
        return_to_main
        ;;
    *)
        echo "Invalid option"
        ;;
esac
