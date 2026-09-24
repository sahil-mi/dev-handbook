# Neovim (LazyVim)

Leader key is `Space`. Press `Space` and wait to see available keys (which-key).

## Modes

| Action | Shortcut |
|---|---|
| Insert before / after cursor | `i` / `a` |
| Insert at line start / end | `I` / `A` |
| New line below / above | `o` / `O` |
| Visual (char / line / block) | `v` / `V` / `Ctrl+V` |
| Back to normal mode | `Esc` |
| Command mode | `:` |

## Movement

| Action | Shortcut |
|---|---|
| Left / down / up / right | `h` / `j` / `k` / `l` |
| Next / previous word | `w` / `b` |
| End of word | `e` |
| Line start / first char / end | `0` / `^` / `$` |
| File top / bottom | `gg` / `G` |
| Go to line N | `:N` or `NG` |
| Half page down / up | `Ctrl+D` / `Ctrl+U` |
| Jump to matching bracket | `%` |
| Jump to char on line | `f<char>` / `t<char>` (`;` repeats) |
| Jump back / forward | `Ctrl+O` / `Ctrl+I` |
| Flash jump (LazyVim) | `s` |

## Editing

| Action | Shortcut |
|---|---|
| Delete char | `x` |
| Delete / yank / change line | `dd` / `yy` / `cc` |
| Delete / change word | `dw` / `cw` |
| Delete / change inside quotes | `di"` / `ci"` |
| Delete / change inside brackets | `di(` / `ci{` |
| Delete to end of line | `D` |
| Paste after / before | `p` / `P` |
| Undo / redo | `u` / `Ctrl+R` |
| Repeat last change | `.` |
| Indent / unindent | `>>` / `<<` |
| Join lines | `J` |
| Toggle comment | `gcc` (line), `gc` (visual) |
| Move line down / up | `Alt+J` / `Alt+K` |

## Search & Replace

| Action | Shortcut |
|---|---|
| Search forward / backward | `/text` / `?text` |
| Next / previous match | `n` / `N` |
| Search word under cursor | `*` |
| Clear highlight | `Esc` |
| Replace in file | `:%s/old/new/g` |
| Replace with confirm | `:%s/old/new/gc` |
| Search & replace across project | `Space → s → r` |

## Files & Find

| Action | Shortcut |
|---|---|
| Find files | `Space → Space` |
| Grep in project | `Space → /` |
| Recent files | `Space → f → r` |
| Open buffers | `Space → ,` |
| File explorer (neo-tree) | `Space → e` |
| Save | `Ctrl+S` or `:w` |
| Quit / force quit | `:q` / `:q!` |
| Save and quit | `:wq` |
| Quit all | `Space → q → q` |

## Buffers

| Action | Shortcut |
|---|---|
| Next / previous buffer | `Shift+L` / `Shift+H` |
| Close buffer | `Space → b → d` |
| Close other buffers | `Space → b → o` |
| Switch to last buffer | `` Space → ` `` |

## Windows (splits)

| Action | Shortcut |
|---|---|
| Split right | `Space → \|` |
| Split below | `Space → -` |
| Move between windows | `Ctrl+H/J/K/L` |
| Close window | `Space → w → d` |
| Resize | `Ctrl+Arrow keys` |

## Code (LSP)

| Action | Shortcut |
|---|---|
| Go to definition | `gd` |
| Find references | `gr` |
| Hover docs | `K` |
| Code action | `Space → c → a` |
| Rename symbol | `Space → c → r` |
| Format file | `Space → c → f` |
| Next / previous diagnostic | `]d` / `[d` |
| Line diagnostics | `Space → c → d` |

## Git

| Action | Shortcut |
|---|---|
| Lazygit | `Space → g → g` |
| Next / previous hunk | `]h` / `[h` |
| Blame line | `Space → g → b` |

## Terminal

| Action | Shortcut |
|---|---|
| Toggle terminal | `Ctrl+/` |
| Exit terminal mode | `Esc Esc` |

## Neo-tree (inside explorer)

| Action | Shortcut |
|---|---|
| Open file | `Enter` |
| Add file / folder | `a` (end with `/` for folder) |
| Delete / rename | `d` / `r` |
| Copy / cut / paste | `c` / `x` / `p` |
| Toggle hidden files | `H` |
| Help | `?` |

## Misc

`:Lazy` — plugin manager

`:Mason` — install LSP servers, formatters, linters

`Space → s → k` — search all keymaps
