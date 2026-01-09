#!/bin/bash

# Get the PID of the active window
ACTIVE_PID=$(hyprctl activewindow -j | jq -r '.pid')

# Find the fish shell process that's a child of this window
SHELL_PID=$(pgrep -P "$ACTIVE_PID" fish | head -n1)

# If fish isn't a direct child, look deeper
if [ -z "$SHELL_PID" ]; then
  # Look for any fish process in the process tree
  for pid in $(pgrep -P "$ACTIVE_PID"); do
    SHELL_PID=$(pgrep -P "$pid" fish | head -n1)
    [ -n "$SHELL_PID" ] && break
  done
fi

# Get the working directory of the fish shell
if [ -n "$SHELL_PID" ]; then
  CWD=$(readlink -f /proc/"$SHELL_PID"/cwd 2>/dev/null)
fi

# Fallback to home if we couldn't find it
if [ -z "$CWD" ] || [ ! -d "$CWD" ]; then
  CWD="$HOME"
fi

kitty --directory "$CWD" 2>/dev/null &
