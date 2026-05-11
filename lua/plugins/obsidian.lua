local ok, local_config = pcall(require, "config.local")

local obsidian = ok and local_config.obsidian or {}
local workspaces = obsidian.workspaces or {
  { name = "personal", path = "~/notes/personal" },
  { name = "studies", path = "~/notes/studies" },
}

local notes_subdir = obsidian.notes_subdir or "01 Inbox"

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>o", false, desc = "+obsidian", ft = "markdown" },
    { "<leader>oo", "<cmd>Obsidian open<cr>", desc = "Open In Obsidian", ft = "markdown" },
    { "<leader>ot", "<cmd>Obsidian today<cr>", desc = "Today Note", ft = "markdown" },
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "New Note", ft = "markdown" },
    { "<leader>oq", "<cmd>Obsidian quick_switch<cr>", desc = "Quick Switch", ft = "markdown" },
    { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Search Notes", ft = "markdown" },
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Backlinks", ft = "markdown" },
    { "<leader>ol", "<cmd>Obsidian links<cr>", desc = "Links In Note", ft = "markdown" },
    { "<leader>ow", "<cmd>Obsidian workspace<cr>", desc = "Switch Workspace", ft = "markdown" },
    { "<leader>op", "<cmd>Obsidian paste_img<cr>", desc = "Paste Image", ft = "markdown" },
    { "<leader>oc", "<cmd>Obsidian toc<cr>", desc = "Table Of Contents", ft = "markdown" },
  },
  opts = {
    legacy_commands = false,
    workspaces = workspaces,
    notes_subdir = notes_subdir,
    preferred_link_style = "wiki",
    new_notes_location = "notes_subdir",
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },
  },
}
