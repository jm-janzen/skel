#!/bin/sh -e

# Setup monitors
xrandr && xrandr --output DVI-0 --left-of HDMI-0

# Set random wallpapers
feh --randomize --bg-fill ~/images/wallpapers/*
