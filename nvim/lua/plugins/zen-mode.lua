return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>z", function() require("zen-mode").toggle() end, desc = "Toggle Zen Mode" },
  },
  opts = {
    plugins = {
      twilight = { enabled = true },
    },
    on_open = function()
      -- run at startup too
      -- schedule so it runs after LazyVim finishes booting
      vim.schedule(function()
        require("zen-mode").open()
      end)
    end,
  },
}
