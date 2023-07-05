#!/bin/bash

# Function to increase volume by 10%
increase_volume_10() {
    pactl list | grep -oP 'Sink #\K([0-9]+)' | while read -r i ; do pactl -- set-sink-volume $i +10% ; done
    bash vup.sh
}

# Function to increase volume by 50%
increase_volume_50() {
    pactl list | grep -oP 'Sink #\K([0-9]+)' | while read -r i ; do pactl -- set-sink-volume $i +50% ; done
    bash vup.sh
}

# Function to increase volume by 100%
increase_volume_100() {
    pactl list | grep -oP 'Sink #\K([0-9]+)' | while read -r i ; do pactl -- set-sink-volume $i +100% ; done
    bash vup.sh
}

# Function to increase volume by 150%
increase_volume_150() {
    pactl list | grep -oP 'Sink #\K([0-9]+)' | while read -r i ; do pactl -- set-sink-volume $i +150% ; done
    bash vup.sh
}

# Function to return
return_to_main() {
    bash main.sh
}

# Dialog menu options
options=(
    1 "+10%"
    2 "+50%"
    3 "+100%"
    4 "+150%"
    5 "Return"
)

# Dialog menu title
title="Increase Volume"

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
