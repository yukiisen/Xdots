# Xdots

**My config files ._.**

This config is kida messy BTW, please tell me if I forgot something.

<img src="https://raw.githubusercontent.com/yukiisen/Xdots/refs/heads/main/screenshot.png" />

## Applications:

First Install these:
- Rofi (app launcher)
- Picom (conpositor for X)
- Vim (optional)
- fish (optional, bash alternative)
- pywal (Supported on DWM, st and Rofi)
- Exa (alternative to `ls`, you can use `l` to run it if you apply the fish config)

For Rofi install:
- scrot (to take screenshots)
- xclip (to copy screenshots immediately)

For video as wallpaper install:
- mpv
- xwinwrap

You can find all of them on `pacman` or `yay` or the package manager of your distro.

**Don't forget to install X11 libs ._.**

## Setup:

Move `picom`, `rofi` and `fish` folders into `~/.config/` directory.

Build and install `DWM` and `st` and `slstatus`:

In the `dwm/` directory:
```bash
make
sudo make install
```

Move `rofi-applet-apps.rasi` to `/usr/lib/python3.13/site-packages/pywal/templates` for pywal support.
```bash
sudo mv ./rofi-applet-apps.rasi /usr/lib/python3.13/site-packages/pywal/templates/
```

Finally move the `wallpaper.sh` and `start.sh` files to the `~/.scripts/` directory. (optional)

Now run `startx` and press `Alt+ENTER` to open `st` then type `start` to run all other tools, then press `Alt+n` to update DWM's colors.

## Shortcuts:

- `Alt+a`         App launcher
- `Alt+p`         Screenshot
- `Alt+q`         Close Window
- `Alt+[1-9]`     Move to workspace
- `Alt+n`         Refresh colors after running pywal.
- `Super+a`       Quick access (Change the config to your preferred apps)
- `Super+q`       Power Menu
- `Super+[1-9]`   Move window to workspace
