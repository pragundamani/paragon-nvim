-- How to use: Open a markdown-like buffer and use <CR>, o/O, Tab, and S-Tab for list editing.

local filetypes = { "markdown", "text", "tex", "plaintex" }

local function key(lhs, rhs, desc, opts)
  return vim.tbl_extend("force", {
    lhs,
    rhs,
    ft = filetypes,
    desc = desc,
  }, opts or {})
end

local function split_list_item(line)
  local patterns = {
    "^(%s*[-+*]%s+)(.*)$",
    "^(%s*%d+[.)]%s+)(.*)$",
    "^(%s*%u+[.)]%s+)(.*)$",
    "^(%s*%a[.)]%s+)(.*)$",
    "^(%s*\\item%s+)(.*)$",
  }

  for _, pattern in ipairs(patterns) do
    local prefix, rest = line:match(pattern)
    if prefix then
      return prefix, rest
    end
  end
end

local function set_checkbox(raw)
  return function()
    local line = vim.api.nvim_get_current_line()
    local prefix, rest = split_list_item(line)
    if not prefix then
      return
    end

    rest = rest:gsub("^%[[^%]]-%]%s*", "", 1)
    rest = rest:gsub("^%[[ xX]%]%s*", "", 1)
    vim.api.nvim_set_current_line(prefix .. raw .. " " .. rest)
  end
end

local keys = {
  key("<leader>a", false, "+autolist"),
  key("<leader>ak", false, "+checklist"),
  key("<Tab>", "<cmd>AutolistTab<cr>", "List Indent", { mode = "i" }),
  key("<S-Tab>", "<cmd>AutolistShiftTab<cr>", "List Outdent", { mode = "i" }),
  key("<CR>", "<CR><cmd>AutolistNewBullet<cr>", "New List Item", { mode = "i" }),
  key("o", "o<cmd>AutolistNewBullet<cr>", "New List Item Below", { mode = "n" }),
  key("O", "O<cmd>AutolistNewBulletBefore<cr>", "New List Item Above", { mode = "n" }),
  key("<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>", "Toggle Checkbox", { mode = "n" }),
  key("<C-r>", "<cmd>AutolistRecalculate<cr>", "Renumber List", { mode = "n" }),
  key("<leader>ab", "<cmd>AutolistNewBullet<cr>", "New List Item Below", { mode = "n" }),
  key("<leader>aB", "<cmd>AutolistNewBulletBefore<cr>", "New List Item Above", { mode = "n" }),
  key("<leader>ax", "<cmd>AutolistToggleCheckbox<cr>", "Toggle Checkbox", { mode = "n" }),
  key("<leader>ar", "<cmd>AutolistRecalculate<cr>", "Renumber List", { mode = "n" }),
  key("<leader>cn", function()
    return require("autolist").cycle_next_dr()
  end, "Cycle List Forward", { expr = true, mode = "n" }),
  key("<leader>an", function()
    return require("autolist").cycle_next_dr()
  end, "Cycle List Forward", { expr = true, mode = "n" }),
  key("<leader>cp", function()
    return require("autolist").cycle_prev_dr()
  end, "Cycle List Backward", { expr = true, mode = "n" }),
  key("<leader>ap", function()
    return require("autolist").cycle_prev_dr()
  end, "Cycle List Backward", { expr = true, mode = "n" }),
  key(">>", ">><cmd>AutolistRecalculate<cr>", "Indent And Renumber", { mode = "n" }),
  key("<<", "<<<cmd>AutolistRecalculate<cr>", "Outdent And Renumber", { mode = "n" }),
  key("dd", "dd<cmd>AutolistRecalculate<cr>", "Delete And Renumber", { mode = "n" }),
  key("d", "d<cmd>AutolistRecalculate<cr>", "Delete And Renumber", { mode = "v" }),
}

local checklist_keys = {
  { "a", "[a]", "Appointment" },
  { ".", "[.]", "Event" },
  { ">", "[>]", "Reschedule" },
  { "<", "[<]", "Delegate" },
  { "-", "[-]", "Note" },
  { "R", "[R]", "Rush" },
  { "$", "[$]", "Payment" },
  { "i", "[i]", "Idea" },
  { "s", "[s]", "Schedule" },
  { "m", "[m]", "Contact" },
  { "?", "[?]", "Lookup" },
  { "t", "[t]", "Travel" },
  { "w", "[w]", "Work" },
  { "=", "[=]", "Study" },
  { "p", "[p]", "Pending" },
  { "~", "[~]", "Cancel" },
  { "!", "[!]", "Important" },
  { "/", "[/]", "Work In Progress" },
  { "x", "[x]", "Done" },
  { "o", "[o]", "Vis" },
  { "c", "[c]", "Call" },
  { "S", "[S]", "Send" },
  { "u", "[u]", "Upload" },
  { "d", "[d]", "Download" },
  { "b", "[b]", "Buy" },
  { "f", "[f]", "Future" },
}

for _, mapping in ipairs(checklist_keys) do
  table.insert(keys, key("<leader>ak" .. mapping[1], set_checkbox(mapping[2]), mapping[3], { mode = "n" }))
end

return {
  "gaoDean/autolist.nvim",
  ft = filetypes,
  opts = {},
  keys = keys,
}
