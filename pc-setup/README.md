# PC setup (terminal)

Installs on a fresh Ubuntu/GNOME PC: zsh + oh-my-zsh, kitty (default terminal),
herdr, neovim + LazyVim config, glow, JetBrainsMono/FiraCode Nerd Fonts, and
copies all configs (kitty theme, herdr, nvim, zshrc, gitconfig, GNOME Terminal colors).

## New PC
1. Copy this `pc-setup` folder over (USB / git / Drive).
2. Double-click-ish: right-click `install.sh` -> **Run as a Program**
   (or in a terminal: `./install.sh`). Enter your sudo password when asked.
3. Log out and back in. Open kitty, run `herdr`.

Existing configs on the new PC are moved to `~/.config-backup-<timestamp>`.

## Keeping it up to date (on this PC)
Run `./sync.sh` after changing kitty/herdr/nvim configs.
Edit `configs/zshrc` directly (it's the portable version of ~/.zshrc).
