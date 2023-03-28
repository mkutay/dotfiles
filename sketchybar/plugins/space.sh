#!/usr/bin/env bash

source ~/.config/info.sh

if [ "$SELECTED" = "true" ]; then
  sketchybar -m --set $NAME icon=""
else
  sketchybar -m --set $NAME icon=""
fi
