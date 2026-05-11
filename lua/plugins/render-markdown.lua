-- How to use: Open a markdown buffer to see rendered headings, bullets, checkboxes, quotes, and code blocks.

return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
  keys = {
    {
      "<leader>le",
      "<cmd>RenderMarkdown buf_enable<cr>",
      desc = "Enable Markdown Render",
      ft = "markdown",
    },
    {
      "<leader>ld",
      "<cmd>RenderMarkdown buf_disable<cr>",
      desc = "Disable Markdown Render",
      ft = "markdown",
    },
  },
  opts = {
    preset = "lazy",
    file_types = { "markdown" },
    render_modes = { "n", "c", "t" },
    anti_conceal = {
      enabled = true,
    },
    checkbox = {
      enabled = true,
      custom = {
        appointment = { raw = "[a]", rendered = "△ ", highlight = "RenderMarkdownHint" },
        event = { raw = "[.]", rendered = "○ ", highlight = "RenderMarkdownInfo" },
        reschedule = { raw = "[>]", rendered = "> ", highlight = "RenderMarkdownWarn" },
        delegate = { raw = "[<]", rendered = "< ", highlight = "RenderMarkdownHint" },
        note = { raw = "[-]", rendered = "- ", highlight = "RenderMarkdownInfo" },
        rush = { raw = "[R]", rendered = "≫ ", highlight = "RenderMarkdownError" },
        payment = { raw = "[$]", rendered = "$ ", highlight = "RenderMarkdownSuccess" },
        idea = { raw = "[i]", rendered = "⚡ ", highlight = "RenderMarkdownHint" },
        schedule = { raw = "[s]", rendered = "🢖 ", highlight = "RenderMarkdownInfo" },
        contact = { raw = "[m]", rendered = "🢔 ", highlight = "RenderMarkdownSuccess" },
        lookup = { raw = "[?]", rendered = "? ", highlight = "RenderMarkdownWarn" },
        travel = { raw = "[t]", rendered = "󰍎 ", highlight = "RenderMarkdownHint" },
        work = { raw = "[w]", rendered = "💼 ", highlight = "RenderMarkdownInfo" },
        study = { raw = "[=]", rendered = "󰈙 ", highlight = "RenderMarkdownHint" },
        pending = { raw = "[p]", rendered = "🗘 ", highlight = "RenderMarkdownWarn" },
        cancel = { raw = "[~]", rendered = "∿ ", highlight = "RenderMarkdownError" },
        important = { raw = "[!]", rendered = "‼ ", highlight = "RenderMarkdownError" },
        wip = { raw = "[/]", rendered = "/ ", highlight = "RenderMarkdownTodo" },
        done = { raw = "[x]", rendered = "✕ ", highlight = "RenderMarkdownChecked" },
        vis = { raw = "[o]", rendered = "⊙ ", highlight = "RenderMarkdownInfo" },
        call = { raw = "[c]", rendered = "📞 ", highlight = "RenderMarkdownHint" },
        send = { raw = "[S]", rendered = "➢ ", highlight = "RenderMarkdownSuccess" },
        upload = { raw = "[u]", rendered = "⭱ ", highlight = "RenderMarkdownSuccess" },
        download = { raw = "[d]", rendered = "⭳ ", highlight = "RenderMarkdownSuccess" },
        buy = { raw = "[b]", rendered = "🛒 ", highlight = "RenderMarkdownSuccess" },
        future = { raw = "[f]", rendered = "F ", highlight = "RenderMarkdownHint" },
        rush_legacy = { raw = "[>>]", rendered = "≫ ", highlight = "RenderMarkdownError" },
        send_legacy = { raw = "[->]", rendered = "➢ ", highlight = "RenderMarkdownSuccess" },
      },
    },
    bullet = {
      enabled = true,
    },
    code = {
      sign = false,
    },
    heading = {
      sign = false,
    },
  },
}
