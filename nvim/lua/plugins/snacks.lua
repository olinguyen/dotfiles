local is_ssh = os.getenv("SSH_TTY") ~= nil

return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    if is_ssh then
      opts.animate = { enabled = false }
      opts.scroll = { enabled = false }
    end
  end,
}
