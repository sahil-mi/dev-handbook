-- Moonfly: near-black background, white text, vivid green. Matches
-- kitty (moonfly.conf) and herdr.
-- Other options kept installed: "catppuccin" (Mocha) and "tokyonight"
-- (LazyVim default). Change colorscheme below to switch.
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
    opts = { colorscheme = "moonfly" },
  },
}
