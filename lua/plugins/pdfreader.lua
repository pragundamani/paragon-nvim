return {
  {
    "r-pletnev/pdfreader.nvim",
    event = { "BufReadPre *.pdf", "BufNewFile *.pdf" },
    cmd = "PDFReader",
    dependencies = {
      "folke/snacks.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("pdfreader").setup()
    end,
  },
}
