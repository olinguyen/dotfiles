return {
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = {},
  -- },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "vault",
          path = "~/Documents/Obsidian-Vault",
        },
      },
    },
  },
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>m", "<cmd>MaximizerToggle<CR>", desc = "Maximize/Restore window" },
    },
  },
}
