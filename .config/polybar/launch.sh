#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit

echo "---" >> /tmp/polybar-bottom.log
polybar bottom -r -l warning 2>&1 | tee -a /tmp/polybar-bottom.log & disown

