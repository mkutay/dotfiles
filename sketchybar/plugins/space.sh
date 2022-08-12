#!/usr/bin/env bash

if [ "$SELECTED" = "true" ]; then
  sketchybar -m --set $NAME icon.color=0xffff5555
else
  sketchybar -m --set $NAME icon.color=0xffbd93f9
fi
