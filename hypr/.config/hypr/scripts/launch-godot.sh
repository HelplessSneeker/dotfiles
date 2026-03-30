#!/bin/bash
# Launch the latest Godot binary from ~/godot/
GODOT_DIR="$HOME/godot"
GODOT_BIN=$(find "$GODOT_DIR" -maxdepth 1 -name 'Godot_v*' -type f -executable 2>/dev/null | sort -V | tail -1)

if [ -n "$GODOT_BIN" ]; then
    exec "$GODOT_BIN"
else
    notify-send "Godot" "No Godot binary found in $GODOT_DIR"
fi
