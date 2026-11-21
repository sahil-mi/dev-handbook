# Terminal Themes

One color theme across kitty, herdr, Neovim and GNOME Terminal. Configs live in
`pc-setup/configs/`; run `pc-setup/sync.sh` after changing the live files.

## Installed themes

The active one is the uncommented `include` in `~/.config/kitty/theme.conf`.

| Theme | Look | kitty file | herdr | nvim |
|---|---|---|---|---|
| Moonfly | near-black `#080808`, white text, vivid green | `moonfly.conf` | `terminal` + accent `#8cc85f` | `moonfly` |
| Catppuccin Mocha | dark navy, soft pastels | `catppuccin-mocha.conf` | `catppuccin` + accent `#89b4fa` | `catppuccin` |
| Adapta Nokto Maia | dark slate, teal (original) | `adapta-nokto-maia.conf` | `terminal` + green/accent `#1ABB9B` | `tokyonight` |

## Switch theme

Change all four, so panes and nvim match the herdr frame.

| Tool | File | Change | Apply |
|---|---|---|---|
| kitty | `~/.config/kitty/theme.conf` | leave one `include <theme>.conf` uncommented | `Ctrl+Shift+F5` in each window, or open a new one |
| herdr | `~/.config/herdr/config.toml` | `[theme] name` and `[theme.custom]` (old values are in comments there) | `herdr server reload-config` |
| nvim | `~/.config/nvim/lua/plugins/colorscheme.lua` | `colorscheme = "moonfly"` → `"catppuccin"` / `"tokyonight"` | restart nvim |
| GNOME Terminal | Preferences → Profiles | set the theme's profile as default (`Moonfly`, `Catppuccin Mocha`, `Default` = original) | new window |

kitty `theme.conf` example:

```
include moonfly.conf
# include catppuccin-mocha.conf
# include adapta-nokto-maia.conf
```

Try a theme in nvim without saving it: `:colorscheme catppuccin`, or `Space → u → C` for a live picker.

## Preview new themes

```bash
kitty +kitten themes     # live preview of hundreds of themes; Esc to quit
```

Picking one there rewrites `kitty.conf`. To keep the setup above, copy the colors into a new
`~/.config/kitty/<name>.conf` instead and point `theme.conf` at it.

## Add a theme

1. **kitty**: save the theme's kitty colors as `~/.config/kitty/<name>.conf` (most themes ship
   a `kitty.conf` in an `extras/` folder), then `include <name>.conf` in `theme.conf`.
2. **herdr**: use the built-in theme if there is one (`herdr --default-config` lists them),
   otherwise `name = "terminal"` to follow kitty's colors, plus an `accent` in `[theme.custom]`.
3. **nvim**: add the plugin to `lua/plugins/colorscheme.lua` with `lazy = false, priority = 1000`
   and set `colorscheme`. `:Lazy` installs it and pins it in `lazy-lock.json`.
4. **GNOME Terminal**: Preferences → `+` new profile → Colors, untick "Use colors from system
   theme", enter background/text and the 16 palette colors.
5. Run `pc-setup/sync.sh`, then commit.

## Check

| Check | Command |
|---|---|
| kitty colors loaded | `kitty +runpy 'import os; from kitty.config import load_config; o=load_config(os.path.expanduser("~/.config/kitty/kitty.conf")); print(o.background, o.color2)'` |
| herdr config valid | `herdr config check` |
| nvim colorscheme | `:echo g:colors_name` |
