#!/usr/bin/env bash

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.ABC') LABEL='en' ;;
'com.apple.keylayout.Turkish-QWERTY-PC') LABEL='tr' ;;
esac

sketchybar --set $NAME label="$LABEL"
