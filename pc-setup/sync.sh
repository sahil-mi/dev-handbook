#!/usr/bin/env bash
# Run on your CURRENT PC to pull latest configs into this folder.
# (zshrc is kept as the portable version in configs/zshrc; edit that directly.)
set -euo pipefail
CFG="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/configs"
cp ~/.config/kitty/kitty.conf ~/.config/kitty/theme.conf "$CFG/kitty/"
cp ~/.config/herdr/config.toml "$CFG/herdr/"
cp ~/.config/glow/glow.yml "$CFG/glow/"
rsync -a --delete --exclude .git ~/.config/nvim/ "$CFG/nvim/"
cp ~/.gitconfig "$CFG/gitconfig"
dconf dump /org/gnome/terminal/ > "$CFG/gnome/terminal.dconf"
echo "Synced configs into $CFG"
