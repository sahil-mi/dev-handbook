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
| Move line down / up | `Alt+J` / `Alt+K` |

## Copy & Paste

`y` copies to the system clipboard too (LazyVim default), so you can paste outside nvim with `Ctrl+V`.

| Action | Shortcut |
|---|---|
| Select, then copy | `v` / `V` → move → `y` |
| Copy line / 5 lines | `yy` / `5yy` |
| Copy inside `{ }` | `yi{` |
| Copy whole file | `ggVGy` |
| Cut selection | `d` (visual) |
| Paste after / before | `p` / `P` |
| Paste over selection | `p` (visual) |
| Paste last copy again (after pasting over) | `"0p` |

## Comments

Uses the right style per file (`//`, `{/* */}` in JSX, `--`, `#`). Same keys uncomment.

| Action | Shortcut |
|---|---|
| Toggle comment on line | `gcc` |
| Toggle comment on selection | `V` → select → `gc` |
| Toggle comment on 5 lines | `5gcc` |
| Toggle comment inside `{ }` | `gci{` |
| Add comment below / above | `gco` / `gcO` |

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
| Close all other windows | `Ctrl+W → o` |
| Resize | `Ctrl+Arrow keys` |
| Open file in split right / below | `:vsplit file` / `:split file` |

## Code (LSP)

| Action | Shortcut |
|---|---|
| Go to definition (opens the source file, works on imports) | `gd` |
| Jump back after `gd` | `Ctrl+O` |
| Find references | `gr` |
| Functions / symbols in file | `Space → s → s` |
| Symbols across project | `Space → s → S` |
| Outline panel (toggle) | `Space → c → s` |
| Next / previous function | `]f` / `[f` |
| Hover docs | `K` |
| Code action | `Space → c → a` |
| Rename symbol | `Space → c → r` |
| Format file | `Space → c → f` |
| Next / previous diagnostic | `]d` / `[d` |
| Line diagnostics | `Space → c → d` |

LSP keys need a language server for the file type. If `gd` only jumps to the import line,
enable the language in `:LazyExtras` (e.g. `lang.typescript`, `lang.python`) and restart.

## Git

| Action | Shortcut |
|---|---|
| Lazygit | `Space → g → g` |
| Next / previous hunk | `]h` / `[h` |
| Blame line | `Space → g → b` |
| Side-by-side diff, current file | `Space → g → h → d` |
| Diffview: all changes side by side (toggle) | `Space → g → v` |
| Diffview: current file history | `Space → g → F` |
| Diffview: branch vs another branch, all changed files (like a merge request) | `Space → g → m` |

Compare branches with commands:

| Compare | Command |
|---|---|
| Only what this branch added since it split from `main` (MR view) | `:DiffviewOpen main...HEAD` |
| Current files (incl. uncommitted) vs `main` | `:DiffviewOpen main` |
| Any two branches | `:DiffviewOpen branch-a..branch-b` |

## Diffview (inside diffview)

| Action | Shortcut |
|---|---|
| Next / previous file | `Tab` / `Shift+Tab` |
| Next / previous change | `]c` / `[c` |
| Stage / unstage file | `-` (file panel) |
| Focus / toggle file panel | `Space → e` / `Space → b` |
| Help (all keys) | `g?` |
| Close | `Space → g → v` or `:DiffviewClose` |

## Lazygit (inside lazygit)

| Action | Shortcut |
|---|---|
| Switch panel | `1`–`5` or `Tab` / `h` / `l` |
| Move up / down | `k` / `j` |
| Stage / unstage file | `Space` |
| Stage / unstage all | `a` |
| Stage lines or hunks | `Enter` on file, then `Space` (`v` to select a range) |
| Discard changes | `d` |
| Commit / commit in editor | `c` / `C` |
| Amend last commit | `A` |
| Push / pull / fetch | `P` / `p` / `f` |
| New branch | `n` (branches panel) |
| Checkout branch | `Space` (branches panel) |
| Stash changes | `s` |
| Compare with a branch (diff mode) | `W` on branch (branches panel) → Diff; `W` → Exit to stop |
| Undo last action | `z` |
| Filter / search | `/` |
| Back / quit | `Esc` / `q` |
| Help (all keys) | `?` |

## Terminal

| Action | Shortcut |
|---|---|
| Toggle terminal | `Ctrl+/` |
| Exit terminal mode | `Esc Esc` |

## Neo-tree (inside explorer)

| Action | Shortcut |
|---|---|
| Open file | `Enter` |
| Open file in split right / below | `s` / `S` |
| Add file / folder | `a` (end with `/` for folder) |
| Delete / rename | `d` / `r` |
| Copy / cut / paste | `c` / `x` / `p` |
| Toggle hidden files | `H` |
| Help | `?` |

## Misc

`:Lazy` — plugin manager

`:Mason` — install LSP servers, formatters, linters

`Space → s → k` — search all keymaps
