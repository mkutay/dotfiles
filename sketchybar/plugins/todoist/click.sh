#!/usr/bin/env bash

source ~/.config/info.sh

sketchybar -m --set $NAME label="$(python3 /Users/kutay/.config/sketchybar/plugins/todoist/click.py)"
