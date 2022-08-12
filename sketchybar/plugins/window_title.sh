WINDOW_TITLE=$(yabai -m query --windows --window | jq -r ".title")
APP_NAME=$(yabai -m query --windows --window | jq -r ".app")
if [[ "$WINDOW_TITLE" =~ "$APP_NAME" ]]; then
  sketchybar -m --set title label="$WINDOW_TITLE"
  exit 0
fi
if [[ ${#WINDOW_TITLE} -gt 40 ]]; then
  WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-50)
  sketchybar -m --set title label="$APP_NAME - $WINDOW_TITLE"…
  exit 0
fi
sketchybar -m --set title label="$APP_NAME - $WINDOW_TITLE"
