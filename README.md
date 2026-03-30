# CachyOS Hyprland Dotfiles

My personal Hyprland configuration for CachyOS, featuring a modern Wayland desktop environment with custom styling.

![Screenshot](screenshots/desktop.png)

## Components

- **Hyprland** - Dynamic tiling Wayland compositor (modular config)
- **Waybar** - Highly customizable status bar ([inspired by Prateek7071](https://github.com/Prateek7071/dotfiles/tree/main))
- **Hyprlock** - Modern lockscreen ([inspired by MrVivekRajan](https://github.com/MrVivekRajan/Hyprlock-Styles))
- **Hypridle** - Idle daemon (dim, lock, DPMS off, suspend)
- **Hyprpaper** - Wallpaper daemon
- **Hyprshot** - Screenshot utility
- **wlogout** - Wayland logout menu
- **Waybar** - Status bar with arrow-style modules
- **Wofi** - Application launcher
- **Dunst** - Notification daemon
- **LazyVim** - Neovim configuration with plugin management
- **Fish Shell** - Modern shell (CachyOS config + nvm plugin)
- **Kitty** - Terminal emulator
- **Claude Code** - Custom agent definitions

## Dependencies

### Essential
```bash
sudo pacman -S hyprland waybar hyprlock hyprpaper hypridle wlogout fish neovim kitty
```

### Application Launchers & Tools
```bash
sudo pacman -S \
    wofi \               # Application launcher
    dunst \              # Notification daemon
    brightnessctl \      # Brightness control
    playerctl \          # Media player control
    wl-clipboard \       # Clipboard manager
    thunar \             # File manager
    nm-applet            # NetworkManager applet
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

### AUR Packages
```bash
paru -S \
    hyprshot \           # Screenshot utility
    brave-bin \          # Brave browser
    1password \          # Password manager
    youtube-music-bin    # YouTube Music client
```

### Python Development (LazyVim)
```bash
sudo pacman -S python-pynvim pyright ruff
```

> **Note:** Do not use `pip install --user` on Arch-based distros — the system Python is externally managed (PEP 668).
> Install Python tools via `pacman` or `pipx` instead.

## Installation

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
cd ~/dotfiles
bash backup_config.sh
```

### 4. Deploy dotfiles
```bash
cd ~/dotfiles

# Packages without existing configs
stow -v -t ~ claude dunst kitty nvim waybar wlogout wofi

# Packages with existing config files — adopt them into the repo
stow -v -t ~ --adopt fish hypr
```

### 6. Set wallpaper
```bash
mkdir -p ~/Bilder/wallpapers
cp /path/to/your/wallpaper.png ~/Bilder/wallpapers/
# Update hypr/hyprpaper.conf and hypr/colors.conf to point to your wallpaper
```

### 7. Reload Hyprland
```bash
hyprctl reload
```

## Customization

### Hyprland (modular config)
The Hyprland config is split into multiple files sourced from `hypr/hyprland.conf`:
- `monitors.conf` - Monitor configuration
- `autostart.conf` - Startup applications
- `keywords.conf` - Program variables ($terminal, $browser, $menu, etc.)
- `bindings.conf` - All keybindings
- `colors.conf` - Material Design color tokens
- `hyprland.conf` - Look & feel, input, animations, window rules

### Waybar
- Config: `waybar/config.jsonc`
- Style: `waybar/style.css`
- Arrow-style module separators inspired by [Prateek7071's dotfiles](https://github.com/Prateek7071/dotfiles/tree/main)

### Hyprlock
- Config: `hypr/hyprlock.conf`
- Shows day, date, time, user profile photo, and power buttons (reboot/shutdown/suspend)
- Styling inspired by [MrVivekRajan's Hyprlock-Styles](https://github.com/MrVivekRajan/Hyprlock-Styles)

### Hypridle
- Config: `hypr/hypridle.conf`
- 2.5 min: dim screen & keyboard backlight
- 5 min: lock screen
- 5.5 min: turn off display
- 30 min: suspend

### Hyprpaper
- Config: `hypr/hyprpaper.conf`

### wlogout
- Layout: `wlogout/layout`

### LazyVim
Plugin configuration in `nvim/lua/plugins/` with support for Python, React, Markdown, and more.

### Fish Shell
- Config: `fish/config.fish`
- Sources CachyOS fish config
- Plugins: nvm.fish (Node version manager)
- pnpm configured in PATH

## Key Bindings

### Window Management
| Key | Action |
|-----|--------|
| `Super + W` | Close window |
| `Super + V` | Toggle floating |
| `Super + F` | Fullscreen |
| `Super + Shift + P` | Pseudo-tile (dwindle) |
| `Super + Shift + N` | Toggle split (dwindle) |
| `Super + H/J/K/L` | Move focus (left/down/up/right) |
| `Super + Mouse` | Move/resize windows |

### Applications
| Key | Action |
|-----|--------|
| `Super + Return` | Terminal (Kitty) |
| `Super + Space` | Application launcher (Wofi) |
| `Super + B` | Brave browser |
| `Super + Shift + B` | Brave incognito |
| `Super + N` | Neovim (in Kitty) |
| `Super + E` | File manager (Thunar) |
| `Super + P` | 1Password |
| `Super + D` | lazydocker |
| `Super + I` | Octopi (package manager) |
| `Super + G` | Godot |
| `Super + M` | YouTube Music |

### System
| Key | Action |
|-----|--------|
| `Super + Shift + Escape` | Lock screen (Hyprlock) |
| `Super + Escape` | Power menu (wlogout) |
| `Super + Y` | Screenshot region (Hyprshot) |
| `Volume keys` | Volume up/down/mute (wpctl) |
| `Brightness keys` | Brightness up/down (brightnessctl) |
| `Media keys` | Play/pause/next/prev (playerctl) |

### Workspaces
| Key | Action |
|-----|--------|
| `Super + [0-9]` | Switch workspace |
| `Super + Shift + [0-9]` | Move window to workspace |
| `Super + S` | Toggle scratchpad |
| `Super + Shift + S` | Move to scratchpad |
| `Super + Scroll` | Cycle workspaces |
| `Super + Shift + H/L` | Previous/next workspace |

## Structure

Each package mirrors the target path from `~`, so GNU Stow creates symlinks in the right place.

```
dotfiles/
├── hypr/.config/hypr/          # Hyprland configuration
│   ├── hyprland.conf           #   Main config (look & feel, input, animations)
│   ├── monitors.conf           #   Monitor setup
│   ├── autostart.conf          #   Autostart applications
│   ├── keywords.conf           #   Program variables
│   ├── bindings.conf           #   Keybindings
│   ├── colors.conf             #   Color scheme (Material Design tokens)
│   ├── hypridle.conf           #   Idle daemon config
│   ├── hyprlock.conf           #   Lock screen config
│   ├── hyprpaper.conf          #   Wallpaper config
│   └── scripts/                #   Helper scripts
├── waybar/.config/waybar/      # Waybar status bar
├── kitty/.config/kitty/        # Kitty terminal emulator
├── wofi/.config/wofi/          # Wofi application launcher
├── dunst/.config/dunst/        # Dunst notification daemon
├── nvim/.config/nvim/          # LazyVim configuration
├── fish/.config/fish/          # Fish shell configuration
├── wlogout/.config/wlogout/    # wlogout power menu
├── claude/.claude/             # Claude Code agent definitions
│   └── agents/                 #   Custom agent configs
├── screenshots/                # Desktop screenshots
├── backup_config.sh            # Config backup script
├── install-claude.sh           # Claude agent installer
├── .gitignore
└── README.md
```

## Troubleshooting

### Waybar not showing
```bash
pgrep waybar
killall waybar
waybar &
```

### Hyprlock not working
Ensure polkit agent is running (should be in `autostart.conf`):
```
exec-once = /usr/lib/polkit-kde-authentication-agent-1
```

### LazyVim Python autocomplete not working
```bash
sudo pacman -S pyright ruff
# Restart neovim
```

### Wallpaper not loading
Check hyprpaper logs:
```bash
hyprpaper
# Check for errors in output
```

## Notes

- Optimized for CachyOS (Arch-based)
- German keyboard layout configured (`kb_layout = de`)
- Uses Fish shell with CachyOS defaults
- Dwindle tiling layout
- Material Design color tokens derived from wallpaper

## Credits

- Waybar config: [Prateek7071](https://github.com/Prateek7071/dotfiles/tree/main)
- Hyprlock styling: [MrVivekRajan](https://github.com/MrVivekRajan/Hyprlock-Styles)
- Hyprland community and r/unixporn

## License

MIT License - Feel free to use and modify!
