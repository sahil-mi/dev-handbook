#!/usr/bin/env bash
# One-shot terminal setup for a fresh Ubuntu/GNOME machine:
# zsh + oh-my-zsh, kitty, herdr, neovim (LazyVim), lazygit, Nerd Fonts, glow, configs.
# Safe to re-run: existing configs are backed up to ~/.config-backup-<timestamp>.
set -euo pipefail

# Launched by double-click (no terminal attached)? Re-open inside a terminal window.
if [ ! -t 1 ] && command -v gnome-terminal >/dev/null; then
  exec gnome-terminal -- bash -c '"$0"; echo; read -rp "Press Enter to close..."' "$(readlink -f "$0")"
fi

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CFG="$HERE/configs"
BACKUP="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
BIN="$HOME/.local/bin"
export PATH="$BIN:$PATH"
mkdir -p "$BIN" "$HOME/.config" "$HOME/.local/share/applications" "$HOME/.local/share/fonts"

step() { printf '\n\033[1;36m==> %s\033[0m\n' "$*"; }
have() { command -v "$1" >/dev/null 2>&1; }

# copy a file/dir into place, backing up whatever was there
place() {
  local src="$1" dst="$2"
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mkdir -p "$BACKUP/$(dirname "${dst#$HOME/}")"
    mv "$dst" "$BACKUP/${dst#$HOME/}"
  fi
  mkdir -p "$(dirname "$dst")"
  cp -r "$src" "$dst"
  echo "  $dst"
}

step "Installing apt packages (needs sudo)"
sudo apt-get update -y
sudo apt-get install -y zsh git curl wget unzip fontconfig ripgrep fd-find build-essential xclip

step "oh-my-zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
for p in zsh-autosuggestions zsh-syntax-highlighting; do
  d="$HOME/.oh-my-zsh/custom/plugins/$p"
  [ -d "$d" ] || git clone --depth 1 "https://github.com/zsh-users/$p" "$d"
done

step "kitty"
if [ ! -x "$HOME/.local/kitty.app/bin/kitty" ]; then
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
fi
ln -sf "$HOME/.local/kitty.app/bin/kitty" "$HOME/.local/kitty.app/bin/kitten" "$BIN/"
cp "$HOME/.local/kitty.app/share/applications/kitty.desktop" "$HOME/.local/share/applications/"
cp "$HOME/.local/kitty.app/share/applications/kitty-open.desktop" "$HOME/.local/share/applications/"
sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g; \
        s|Exec=kitty|Exec=$HOME/.local/kitty.app/bin/kitty|g" \
  "$HOME"/.local/share/applications/kitty*.desktop
# make kitty the default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator "$HOME/.local/kitty.app/bin/kitty" 50
sudo update-alternatives --set x-terminal-emulator "$HOME/.local/kitty.app/bin/kitty"
printf 'kitty.desktop\n' > "$HOME/.config/xdg-terminals.list"

step "herdr"
have herdr || curl -fsSL https://herdr.dev/install.sh | sh

step "neovim"
if ! have nvim; then
  tmp="$(mktemp -d)"
  curl -fL -o "$tmp/nvim.tar.gz" https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  rm -rf "$HOME/.local/nvim"; mkdir -p "$HOME/.local/nvim"
  tar -xzf "$tmp/nvim.tar.gz" -C "$HOME/.local/nvim" --strip-components=1
  ln -sf "$HOME/.local/nvim/bin/nvim" "$BIN/nvim"
  rm -rf "$tmp"
fi

step "lazygit"
if ! have lazygit; then
  tmp="$(mktemp -d)"
  url="$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest \
        | grep -o 'https://[^"]*lazygit_[^"]*_[Ll]inux_x86_64.tar.gz' | head -1)"
  curl -fL "$url" | tar -xz -C "$tmp" lazygit
  install -m755 "$tmp/lazygit" "$BIN/lazygit"
  rm -rf "$tmp"
fi

step "glow"
if ! have glow; then
  tmp="$(mktemp -d)"
  url="$(curl -fsSL https://api.github.com/repos/charmbracelet/glow/releases/latest \
        | grep -o 'https://[^"]*glow_[^"]*_Linux_x86_64.tar.gz' | head -1)"
  curl -fL "$url" | tar -xz -C "$tmp"
  find "$tmp" -type f -name glow -exec install -m755 {} "$BIN/glow" \;
  rm -rf "$tmp"
fi

step "Nerd Fonts (JetBrainsMono, FiraCode)"
for font in JetBrainsMono FiraCode; do
  if ! fc-list | grep -qi "${font}.*Nerd"; then
    tmp="$(mktemp -d)"
    curl -fL -o "$tmp/f.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${font}.zip"
    unzip -oq "$tmp/f.zip" '*.ttf' -d "$HOME/.local/share/fonts"
    rm -rf "$tmp"
  fi
done
fc-cache -f >/dev/null

step "Copying configs"
place "$CFG/kitty"          "$HOME/.config/kitty"
place "$CFG/herdr/config.toml" "$HOME/.config/herdr/config.toml"
place "$CFG/nvim"           "$HOME/.config/nvim"
place "$CFG/glow"           "$HOME/.config/glow"
place "$CFG/zshrc"          "$HOME/.zshrc"
[ -f "$HOME/.gitconfig" ] || place "$CFG/gitconfig" "$HOME/.gitconfig"
have dconf && dconf load /org/gnome/terminal/ < "$CFG/gnome/terminal.dconf" || true

step "LazyVim plugins (headless)"
nvim --headless "+Lazy! sync" +qa 2>/dev/null || echo "  (will finish on first nvim launch)"

step "Default shell -> zsh"
[ "$(getent passwd "$USER" | cut -d: -f7)" = "$(command -v zsh)" ] || sudo chsh -s "$(command -v zsh)" "$USER"

printf '\n\033[1;32mDone.\033[0m Log out and back in, then open kitty and run: herdr\n'
if [ -d "$BACKUP" ]; then echo "Old configs backed up to: $BACKUP"; fi
