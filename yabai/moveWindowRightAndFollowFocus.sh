#!/bin/dash
curWindowId="$(yabai -m query --windows --window | jq -re ".id")"

$(yabai -m window --space next || yabai -m window --space first)
$(yabai -m window --focus "$curWindowId")
