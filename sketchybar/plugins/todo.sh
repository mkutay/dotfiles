#!/usr/bin/env bash

TASKS=$(curl -s -X GET https://api.todoist.com/rest/v1/tasks -H "Authorization: Bearer $TODOIST_API_TOKEN" | jq ".")
TASKS_LEN=$(echo $TASKS | jq length)
if [ $TASKS_LEN -eq 0 ]; then
    sketchybar -m --set $NAME label="Enjoy Your Day!"
else
    sketchybar -m --set $NAME label="$TASKS_LEN"
fi
