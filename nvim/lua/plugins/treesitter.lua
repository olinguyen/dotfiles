return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- Let Lazy infer loading; or use a gentle event if you want:
    -- event = { "BufReadPost", "BufNewFile" },

    -- Tell Lazy which module exposes `setup`
    main = "nvim-treesitter.configs",

    -- Lazy will do: require("nvim-treesitter.configs").setup(opts)
    opts = {
      ensure_installed = { "python", "lua", "bash", "json", "yaml", "vim", "vimdoc", "markdown", "markdown_inline" },
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
    },
  },
}
