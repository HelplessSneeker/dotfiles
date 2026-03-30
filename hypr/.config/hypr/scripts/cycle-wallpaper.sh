#!/bin/bash
# Cycle through wallpapers in the dotfiles wallpapers directory

WALLPAPER_DIR="$HOME/dotfiles/wallpapers"
STATE_FILE="/tmp/hypr_wallpaper_index"

# Build sorted array of wallpaper files
mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) \
    | sort)

# Exit if no wallpapers found
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    notify-send "Wallpaper" "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Read current index (default 0)
CURRENT_INDEX=0
if [ -f "$STATE_FILE" ]; then
    CURRENT_INDEX=$(cat "$STATE_FILE")
fi

# Calculate next index with wrap-around
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#WALLPAPERS[@]} ))

NEXT_WALLPAPER="${WALLPAPERS[$NEXT_INDEX]}"
CURRENT_WALLPAPER="${WALLPAPERS[$CURRENT_INDEX]}"

# Preload new wallpaper, set it, then unload the old one
hyprctl hyprpaper preload "$NEXT_WALLPAPER"
hyprctl hyprpaper wallpaper ",$NEXT_WALLPAPER"

# Only unload old if it's different from new (single-wallpaper case)
if [ "$CURRENT_WALLPAPER" != "$NEXT_WALLPAPER" ]; then
    hyprctl hyprpaper unload "$CURRENT_WALLPAPER"
fi

# Save new index
echo "$NEXT_INDEX" > "$STATE_FILE"

# Notify user which wallpaper is now active
notify-send "Wallpaper" "$(basename "$NEXT_WALLPAPER")" -t 2000
