-- Active: "tokyonight" (LazyVim default), paired with kitty Adapta Nokto Maia.
-- Also installed: "moonfly" (pairs with kitty moonfly.conf) and "catppuccin"
-- (Mocha, pairs with catppuccin-mocha.conf). Change colorscheme below to switch.
return {
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = { flavour = "mocha" },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight" },
  },
}
