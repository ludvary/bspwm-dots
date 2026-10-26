#!/usr/bin/env bash
# usage: toggle.sh <window>     e.g. toggle.sh bottombar | sidebar | sysmon
w="${1:?usage: toggle.sh <window>}"

[ "$w" = sidebar ] && rm -f "${XDG_RUNTIME_DIR:-/tmp}/eww-rail-autohidden"

# space bspwm keeps free while a bar is open (bar size + its screen margin)
SIDE_PAD=60      # left rail: 50px wide + 10px margin
BOTTOM_PAD=0     # set to 56 (46px tall + 10px margin) if the bottom bar should push windows up too

pgrep -x eww >/dev/null || { eww daemon; sleep 0.5; }

pad() { bspc config "${1}_padding" "$2" 2>/dev/null; }

if eww active-windows | grep -q "^${w}:"; then
    eww close "$w"
    case "$w" in
        sidebar)   pad left 0 ;;
        bottombar) pad bottom 0 ;;
    esac
else
    eww open "$w"
    case "$w" in
        sidebar)   pad left "$SIDE_PAD" ;;
        bottombar) pad bottom "$BOTTOM_PAD" ;;
    esac
fi
