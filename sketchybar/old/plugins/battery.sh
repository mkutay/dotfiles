# Colors
icon_color="0xffdf7193"
label_color="0xffdf7193"
highlight_color="0xff851e3e"
background_color="0xff451e3e"
BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep "AC Power")
if [[ $CHARGING != "" ]]; then
  sketchybar -m --set battery           \
    icon.color=$icon_color           \
    icon=                              \
    label=$(printf "${BATT_PERCENT}%%") 
  exit 0
fi
[[ "${BATT_PERCENT}" -gt 10 ]] && COLOR="highlight_color" || COLOR="highlight_color"
case ${BATT_PERCENT} in
   100) ICON="" ;;
    9[0-9]) ICON="" ;;
    8[0-9]) ICON="" ;;
    7[0-9]) ICON="" ;;
    6[0-9]) ICON="" ;;
    5[0-9]) ICON="" ;;
    4[0-9]) ICON="" ;;
    3[0-9]) ICON="" ;;
    2[0-9]) ICON="" ;;
    1[0-9]) ICON="" ;;
    *) ICON=""
esac
sketchybar -m --set battery           \
  icon="$ICON"                        \
  label=$(printf "${BATT_PERCENT}%%")
