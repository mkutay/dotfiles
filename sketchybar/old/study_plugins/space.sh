#!/usr/bin/env bash

if [ "$SELECTED" = "true" ]; then
  sketchybar -m --set $NAME background.color=0xff2e3440
else
  sketchybar -m --set $NAME background.color=0xff434c5e
fi
