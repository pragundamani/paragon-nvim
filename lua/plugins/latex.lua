return {
  {
    "jbyuki/nabla.nvim",
    ft = { "markdown", "tex", "latex" },
    keys = {
      {
        "<leader>lp",
        function()
          require("nabla").popup()
        end,
        desc = "Show LaTeX popup",
      },
      {
        "<leader>lv",
        function()
          require("nabla").toggle_virt()
        end,
        desc = "Toggle LaTeX virtual text",
      },
      {
        "<leader>lr",
        function()
          dofile(vim.fn.stdpath("config") .. "/lua/autolatex.lua")
        end,
        desc = "Auto-render all LaTeX",
      },
    },
    config = function()
      vim.api.nvim_create_user_command("LatexToggle", function()
        require("nabla").toggle_virt()
      end, { desc = "Toggle LaTeX rendering" })

      vim.api.nvim_create_user_command("LatexPopup", function()
        require("nabla").popup()
      end, { desc = "Show LaTeX popup" })

      vim.api.nvim_create_user_command("LatexAuto", function()
        dofile(vim.fn.stdpath("config") .. "/lua/autolatex.lua")
      end, { desc = "Auto-render all LaTeX" })
    end,
  },
}
