# Xdots (and WLdots as well)

**My config files ._.**

This config is kida messy BTW, please tell me if I forgot something.

**Note:** The swayfx config is not completed so make sure to tweak it a little, I'll include it later once I feel like switching.

<img src="https://raw.githubusercontent.com/yukiisen/Xdots/refs/heads/main/screenshot.png" />

## Applications:

First Install these:
- Rofi (app launcher)
- Picom (compositor for X) (`picom-ftlabs-git` BTW if you want picom.conf.def (animation))
- Vim (optional)
- fish (optional, bash alternative)
- pywal (Supported on DWM, st and Rofi) (likley everywhere)
- Exa (alternative to `ls`, you can use `l` to run it if you apply the fish config)
- xdotool (to apply dwm theme at startup)
- feh/xwallpaper.

For Rofi install:
- scrot (to take screenshots)
- xclip (to copy screenshots immediately)

For video as wallpaper install:
- mpv
- xwinwrap

You can find all of them on `pacman` or `yay` or the package manager of your distro.

**Don't forget to install X11 libs ._.**

## Fonts:
The following fonts are required:
- Jetbrains Mono Nerd Font (st/foot)
- Caskaydia Mono Nerd Font (dwm/slstatus)
- Feather (rofi)

## Setup:

Move `picom`, `rofi` and `fish` folders into `~/.config/` directory.

Build and install `DWM` and `st` and `slstatus`:

In the `dwm/` directory:
```bash
make
sudo make install
```
Repeat for both `slstatus` and `st`.

Add this line to your `.xinitrc` file:
```bash
echo "~/.scripts/start.sh && exec dwm" > ~/.xinitrc
```

Move `rofi-applet-apps.rasi` to `/usr/lib/python3.13/site-packages/pywal/templates` for pywal support.
```bash
sudo mv ./rofi-applet-apps.rasi /usr/lib/python3.13/site-packages/pywal/templates/
```

Finally move the `wallpaper.sh` and `start.sh` files to the `~/.scripts/` directory. (optional)

Now run `startx` and press `Alt+ENTER` to open `st` then type `start` to run all other tools, then press `Alt+n` to update DWM's colors. (automated now)

## Shortcuts:

- `Alt+a`         App launcher
- `Alt+p`         Screenshot
- `Alt+q`         Close Window
- `Alt+[1-9]`     Move to workspace
- `Alt+n`         Refresh colors after running pywal.
- `Alt+Shift+q`   Kill the current dwm instance.
- `Super+a`       Quick access (Change the config to your preferred apps)
- `Super+q`       Power Menu
- `Super+[1-9]`   Move window to workspace
