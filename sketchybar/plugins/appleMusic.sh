#!/usr/bin/env bash
RUNNING=$(osascript -e 'if application "Music" is running then return 0')
if [ "$RUNNING" == "" ]; then
  # sketchybar -m --set $NAME drawing=off
  sketchybar -m --set $NAME drawing=on label=""
  exit 0
else
  sketchybar -m --set $NAME drawing=on
fi

PLAYING=0
if [ "$(osascript -e 'if application "Music" is running then tell application "Music" to get player state')" == "playing" ]; then
  PLAYING=1
fi

TRACK=$(osascript -e 'tell application "Music" to name of current track as string' 2>/dev/null || echo "unknown track")
ARTIST=$(osascript -e 'tell application "Music" to artist of current track as string' 2>/dev/null || echo "unknown artist")
ALBUM=$(osascript -e 'tell application "Music" to get album of current track as string' 2>/dev/null || echo "unknown album")

if [[ ${#TRACK} -gt 30 ]]; then
  TRACK="$(echo "$TRACK" | cut -c 1-30)…"
fi
if [[ ${#ARTIST} -gt 30 ]]; then
  ARTIST="$(echo "$ARTIST" | cut -c 1-30)…"
fi
if [[ ${#ALBUM} -gt 30 ]]; then
  ALBUM="$(echo "$ALBUM" | cut -c 1-30)…"
fi

if [ "$TRACK" == "unknown track" ]; then
  sketchybar -m --set $NAME drawing=on label=""
  exit 0
else 
  sketchybar -m --set $NAME drawing=on
fi

LABEL=""
if [ "$ARTIST" == "unknown artist" ]; then
  LABEL="$TRACK - $ALBUM"
else
  LABEL="$TRACK - $ARTIST"
fi

if [ $PLAYING -eq 0 ]; then
  sketchybar -m --set $NAME drawing=on label.font="Iosevka Fixed:Light Oblique:14.0"
  # LABEL="$LABEL (NP)"
else
  sketchybar -m --set $NAME drawing=on label.font="Iosevka Fixed:Bold:14.0"
fi

sketchybar -m --set $NAME drawing=on label="$LABEL"
