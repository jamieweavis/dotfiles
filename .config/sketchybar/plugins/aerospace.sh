#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# Update all workspace indicators at once
for i in {1..5}; do
    if [ "$i" = "$FOCUSED_WORKSPACE" ]; then
        sketchybar --set "space.$i" background.drawing=on label.color=0xff000000
    else
        sketchybar --set "space.$i" background.drawing=off label.color=0xffffffff
    fi
done
