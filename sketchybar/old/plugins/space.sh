#!/usr/bin/env bash

if [ "$SELECTED" = "true" ]; then
  sketchybar -m --set $NAME background.color=0xff851e3e
else
  sketchybar -m --set $NAME background.color=0xff451e3e
fi
