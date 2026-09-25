return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    {
      "<leader>gv",
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd("DiffviewOpen")
        else
          vim.cmd("DiffviewClose")
        end
      end,
      desc = "Diffview (toggle)",
    },
    { "<leader>gF", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview File History" },
    {
      "<leader>gm",
      function()
        -- guess the default branch: origin/HEAD, else the first of these that exists
        local base = vim.fn.systemlist("git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null")[1]
        if vim.v.shell_error ~= 0 or not base then
          base = "main"
          for _, b in ipairs({ "origin/main", "origin/master", "origin/develop", "main", "master" }) do
            vim.fn.system({ "git", "rev-parse", "--verify", "--quiet", b })
            if vim.v.shell_error == 0 then
              base = b
              break
            end
          end
        end
        vim.ui.input({ prompt = "Compare with branch: ", default = base }, function(input)
          if input and input ~= "" then
            vim.cmd("DiffviewOpen " .. input .. "...HEAD")
          end
        end)
      end,
      desc = "Diffview vs branch (merge request)",
    },
  },
}
