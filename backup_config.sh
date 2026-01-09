# Create timestamped backup
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR/.config"

# Move each config directory to backup
cd ~/.config
for dir in hypr waybar nvim fish wlogout; do
  if [ -d "$dir" ] && [ ! -L "$dir" ]; then
    echo "Backing up $dir"
    mv "$dir" "$BACKUP_DIR/.config/"
  fi
done
