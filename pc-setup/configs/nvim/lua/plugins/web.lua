-- HTML/JSX helpers: Emmet abbreviations (div.box>p*3 → Tab), HTML/CSS completion.
-- Tag auto-close/rename comes from nvim-ts-autotag (LazyVim core).
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_language_server = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascriptreact",
            "typescriptreact",
          },
        },
        html = {},
        cssls = {},
      },
    },
  },
}
