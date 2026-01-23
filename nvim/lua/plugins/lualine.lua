return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Theme and separators
    opts.options.theme = "auto"
    opts.options.section_separators = { left = "\u{e0b4}", right = "\u{e0b6}" }
    opts.options.component_separators = ""
    opts.options.globalstatus = true

    -- Add rounded separators to mode
    opts.sections.lualine_a = {
      { "mode", separator = { left = "\u{e0b6}", right = "\u{e0b4}" }, padding = 1 },
    }

    -- Add rounded separators to branch
    opts.sections.lualine_b = {
      { "branch", separator = { left = "\u{e0b6}", right = "\u{e0b4}" }, padding = 1 },
    }

    -- Add search count to section c (keeps existing components)
    table.insert(opts.sections.lualine_c, {
      function()
        if vim.v.hlsearch == 0 then return "" end
        local ok, result = pcall(vim.fn.searchcount, { maxcount = 999 })
        if not ok or result.total == 0 then return "" end
        return string.format(" %d/%d", result.current, result.total)
      end,
    })

    -- Simplify section x
    opts.sections.lualine_x = {
      { "diff", padding = 1 },
      { "filetype", icon_only = true, padding = 1 },
    }

    -- Simplify section y
    opts.sections.lualine_y = {
      { "progress", separator = { left = "\u{e0b6}", right = "\u{e0b4}" }, padding = 1 },
    }

    -- Remove time from section z
    opts.sections.lualine_z = {}
  end,
}
