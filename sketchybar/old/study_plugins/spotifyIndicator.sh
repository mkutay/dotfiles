#!/usr/bin/env bash
RUNNING=$(osascript -e 'if application "Music" is running then return 0')
if [ "$RUNNING" == "" ]; then
  RUNNING=1
fi
PLAYING=1
TRACK=""
ALBUM=""
ARTIST=""
sketchybar -m --set $NAME drawing=on
if [ "$(osascript -e 'if application "Music" is running then tell application "Music" to get player state')" == "playing" ]; then
  PLAYING=0
fi
#  TRACK=$(osascript -e 'tell application "Music" to name of current track as string' 2>/dev/null || echo "unknown track")
#  ARTIST=$(osascript -e 'tell application "Music" to artist of current track as string' 2>/dev/null || echo "unknown artist")
#  ALBUM=$(osascript -e 'tell application "Music" to get album of current track as string' 2>/dev/null || echo "unknown album")
#fi
TRACK=$(osascript -e 'tell application "Music" to name of current track as string' 2>/dev/null || echo "unknown track")
ARTIST=$(osascript -e 'tell application "Music" to artist of current track as string' 2>/dev/null || echo "unknown artist")
ALBUM=$(osascript -e 'tell application "Music" to get album of current track as string' 2>/dev/null || echo "unknown album")
if [ $RUNNING -eq 0 ] && [ $PLAYING -eq 0 ]; then
  if [ "$ARTIST" == "unknown artist" ]; then
    sketchybar -m --set $NAME label="$TRACK - $ALBUM"
  elif [ "$ALBUM" == "unknown album" ]; then
    sketchybar -m --set $NAME label="$TRACK - $ARTIST"
  else
    sketchybar -m --set $NAME label="$TRACK / $ALBUM - $ARTIST"
  fi
else
  if [ $RUNNING -eq 0 ]; then
    if [ "$ARTIST" == "unknown artist" ]; then
      sketchybar -m --set $NAME label="$TRACK - $ALBUM (NP)"
    elif [ "$ALBUM" == "unknown album" ]; then
      sketchybar -m --set $NAME label="$TRACK - $ARTIST (NP)"
    else
      sketchybar -m --set $NAME label="$TRACK / $ALBUM - $ARTIST (NP)"
    fi
  else
    sketchybar -m --set $NAME label="Not Running"
  fi
fi
