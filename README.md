# CachyOS Hyprland Dotfiles

My personal Hyprland configuration for CachyOS, featuring a modern Wayland desktop environment with custom styling.

![Screenshot](screenshots/desktop.png)

## 🚀 Components

- **Hyprland** - Dynamic tiling Wayland compositor
- **Waybar** - Highly customizable status bar ([inspired by Prateek7071](https://github.com/Prateek7071/dotfiles/tree/main))
- **Hyprlock** - Modern lockscreen ([inspired by MrVivekRajan](https://github.com/MrVivekRajan/Hyprlock-Styles))
- **Hyprpaper** - Wallpaper daemon
- **wlogout** - Wayland logout menu
- **LazyVim** - Neovim configuration with plugin management
- **Fish Shell** - Modern, user-friendly shell

## 📦 Dependencies

### Essential
```bash
sudo pacman -S hyprland waybar hyprlock hyprpaper wlogout fish neovim kitty
```

### Application Launchers & Tools
```bash
sudo pacman -S \
    rofi-wayland \       # Application launcher
    dunst \              # Notification daemon
    grim \               # Screenshot utility
    slurp \              # Screen area selector
    wl-clipboard \       # Clipboard manager
    brightnessctl \      # Brightness control
    pamixer              # Audio control
```

### System Integration
```bash
sudo pacman -S \
    polkit-kde-agent \   # Authentication agent
    xdg-desktop-portal-hyprland \
    qt5-wayland \
    qt6-wayland \
    pipewire \
    wireplumber \
    pipewire-pulse
```

### Fonts
```bash
sudo pacman -S \
    ttf-font-awesome \
    ttf-jetbrains-mono-nerd \
    noto-fonts \
    noto-fonts-emoji
```

### AUR Packages (if needed)
```bash
paru -S \
    hyprpicker \         # Color picker
    wlogout
```

### Python Development (LazyVim)
```bash
sudo pacman -S python-pip python-pynvim
pip install --user pyright ruff
```

## 📥 Installation

### 1. Clone the repository
```bash
cd ~
git clone https://github.com/YOUR_USERNAME/dotfiles.git
```

### 2. Install GNU Stow
```bash
sudo pacman -S stow
```

### 3. Backup existing configs
```bash
mkdir -p ~/dotfiles_backup_$(date +%Y%m%d_%H%M%S)/.config
cd ~/.config
for dir in hypr waybar fish nvim wlogout; do
    [ -d "$dir" ] && [ ! -L "$dir" ] && mv "$dir" ~/dotfiles_backup_*/. config/
done
```

### 4. Deploy dotfiles
```bash
cd ~/dotfiles
stow -v -t ~/.config hypr waybar nvim fish hyprlock hyprpaper wlogout
```

### 5. Set wallpaper
```bash
# Place your wallpaper in
mkdir -p ~/Pictures/wallpapers
cp /path/to/your/wallpaper.jpg ~/Pictures/wallpapers/

# Update hyprpaper config to point to your wallpaper
```

### 6. Reload Hyprland
```bash
hyprctl reload
# Or press Super+Shift+R
```

## 🎨 Customization

### Hyprland
Main config: `~/.config/hypr/hyprland.conf`
- Monitor configuration
- Keybindings
- Window rules
- Startup applications
- Animations

### Waybar
- Config: `~/.config/waybar/config`
- Style: `~/.config/waybar/style.css`
- Custom modules and styling inspired by [Prateek7071's dotfiles](https://github.com/Prateek7071/dotfiles/tree/main)

### Hyprlock
- Config: `~/.config/hypr/hyprlock.conf`
- Styling inspired by [MrVivekRajan's Hyprlock-Styles](https://github.com/MrVivekRajan/Hyprlock-Styles)

### Hyprpaper
- Config: `~/.config/hypr/hyprpaper.conf`
- Set wallpapers per monitor

### wlogout
- Config: `~/.config/wlogout/layout`
- Style: `~/.config/wlogout/style.css`
- Icons: `~/.config/wlogout/icons/`

### LazyVim
Plugin configuration in `~/.config/nvim/lua/plugins/`

## ⌨️ Key Bindings

| Key | Action |
|-----|--------|
| `Super + Return` | Terminal (Kitty) |
| `Super + D` | Application launcher (Rofi) |
| `Super + Q` | Close window |
| `Super + F` | Toggle floating |
| `Super + L` | Lock screen (Hyprlock) |
| `Super + M` | Power menu (wlogout) |
| `Super + [1-9]` | Switch workspace |
| `Super + Shift + [1-9]` | Move window to workspace |
| `Super + Mouse` | Move/resize windows |
| `Print` | Screenshot |
| `Super + Print` | Screenshot area |

## 🔧 Maintenance

### Update dotfiles from system
```bash
cd ~/dotfiles
git add .
git commit -m "Update configs"
git push
```

### Pull latest changes
```bash
cd ~/dotfiles
git pull
# Changes are automatically applied via symlinks
```

### Add new config directory
```bash
cd ~/dotfiles
mkdir newapp
cp -r ~/.config/newapp/* newapp/
git add newapp
git commit -m "Add newapp config"
stow -v -t ~/.config newapp
```

## 📁 Structure
```
dotfiles/
├── hypr/           # Hyprland configuration
├── waybar/         # Waybar configuration  
├── nvim/           # LazyVim configuration
├── fish/           # Fish shell configuration
├── wlogout/        # wlogout power menu config
├── screenshots/    # Desktop screenshots
├── .gitignore
└── README.md
```

## 🐛 Troubleshooting

### Waybar not showing
```bash
# Check if waybar is running
pgrep waybar

# Restart waybar
killall waybar
waybar &
```

### Hyprlock not working
Ensure polkit agent is running in your Hyprland config:
```
exec-once = /usr/lib/polkit-kde-authentication-agent-1
```

### LazyVim Python autocomplete not working
```bash
pip install --user pyright ruff
# Restart neovim
```

### Wallpaper not loading
Check hyprpaper logs:
```bash
hyprpaper
# Check for errors in output
```

## 📝 Notes

- Optimized for CachyOS (Arch-based)
- German locale configured by default
- Uses Fish shell - change to bash/zsh if preferred
- Waybar config inspired by Prateek7071's dotfiles
- Hyprlock styling inspired by MrVivekRajan's Hyprlock-Styles

## 🙏 Credits

- Waybar config: [Prateek7071](https://github.com/Prateek7071/dotfiles/tree/main)
- Hyprlock styling: [MrVivekRajan](https://github.com/MrVivekRajan/Hyprlock-Styles)
- Hyprland community and r/unixporn

## 📄 License

MIT License - Feel free to use and modify!
