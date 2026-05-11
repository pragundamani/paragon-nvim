return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*" },
      options = {
        parsers = {
          names = { enable = true },
          hex = { default = true },
          rgb = { enable = true },
          hsl = { enable = true },
        },
        display = {
          mode = "background",
        },
      },
    },
  },
}
