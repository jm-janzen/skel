#!/bin/sh -e

# Setup monitors
xrandr && xrandr --output DVI-I-1 --left-of HDMI-1

# Set random wallpapers
feh --randomize --bg-fill ~/images/wallpapers/*
