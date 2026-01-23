return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    ft = "markdown",
    opts = {
      heading = {
        icons = { "▌ ", "▌ ", "▌ ", "▌ ", "▌ ", "▌ " },
        sign = false,
        width = "block",
        border = true,
        border_virtual = true,
      },
      code = {
        width = "block",
        border = "thick",
      },
      bullet = {
        icons = { "●", "○", "◆", "◇" },
      },
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "markdown", "org", "norg" },
    opts = {},
  },
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
