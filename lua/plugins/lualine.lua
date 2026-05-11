return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local blue = "#4D7FFF"
      local blueDark = "#20336B"
      local fg = "#EFFFFB"

      opts.sections.lualine_a = {
        { "mode", color = { bg = blue, fg = "#000000", gui = "bold" } },
      }

      opts.sections.lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 }, color = { bg = blueDark, fg = fg } },
        { "location", padding = { left = 0, right = 1 }, color = { bg = blueDark, fg = fg } },
      }

      opts.sections.lualine_z = {
        {
          function()
            return " " .. os.date("%R")
          end,
          color = { bg = blue, fg = fg, gui = "bold" },
        },
      }
    end,
  },
}
