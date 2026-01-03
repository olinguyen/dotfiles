return {
  "sindrets/diffview.nvim",
  -- lazy-load on commands / keys so it doesn’t affect startup
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  -- devicons are optional but give nicer icons (LazyVim already ships them)
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- sensible defaults; turn on enhanced diff highlights
  opts = {
    enhanced_diff_hl = true,         -- better intra-line highlights
    use_icons = true,                 -- needs nvim-web-devicons
    view = {
      default = { layout = "diff2_horizontal" },
      merge_tool = { layout = "diff3_horizontal", winbar_info = true },
      file_history = { layout = "diff2_horizontal" },
    },
    -- you can add per-command default args here later if you like:
    -- default_args = { DiffviewOpen = { "--imply-local" }, DiffviewFileHistory = {} },
  },
  -- handy keymaps under <leader>g (Git)
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff (index vs. working tree)" },
    { "<leader>gw", "<cmd>DiffviewOpen -uno<cr>", desc = "Diff (tracked only)" },
    { "<leader>gD", "<cmd>DiffviewOpen origin/HEAD...HEAD<cr>", desc = "Diff (origin..HEAD)" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History (current file)" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo History" },
    { "<leader>gT", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle Files Panel" },
    { "<leader>gF", "<cmd>DiffviewFocusFiles<cr>",  desc = "Focus Files Panel" },
  },
}
