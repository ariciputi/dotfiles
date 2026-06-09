-- return {
--   'nvim-lualine/lualine.nvim',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   config = function()
--     require('lualine').setup({
--         theme = 'auto',
--         options = {
--           icons_enabled = false,
--           component_separators = '',
--           section_separators = '',
--         },
--         sections = {
--           lualine_a = { 'mode' },
--           lualine_b = { 'branch', 'diff' },
--           lualine_c = { { 'filename', path = 1 } },
--           lualine_x = { 'diagnostics' },
--           lualine_y = { 'filetype', 'lsp_status' },
--           lualine_z = { 'location' }
--         },
--       })

--   end
-- }
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    -- Build a kanagawa-based lualine theme, but make the active statusline
    -- stand out. Kanagawa's shipped lualine theme uses bg_p1 (sumiInk4
    -- #2A2A37) for the middle section, which is almost indistinguishable from
    -- the editor bg (sumiInk3 #1F1F28). We pass the theme name explicitly so
    -- this works even though opts is evaluated before `:colorscheme` runs.
    local colors = require("kanagawa.colors").setup({ theme = "wave" })
    local c = colors.theme
    local p = colors.palette

    local theme = {
      normal = {
        a = { bg = c.syn.fun, fg = c.ui.bg_m3, gui = "bold" },
        b = { bg = c.diff.change, fg = c.syn.fun },
        -- Active middle section: a prominent neutral gray so the focused
        -- statusline clearly stands out from the editor background.
        c = { bg = p.sumiInk6, fg = p.fujiWhite },
      },
      insert = {
        a = { bg = c.diag.ok, fg = c.ui.bg, gui = "bold" },
        b = { bg = c.ui.bg, fg = c.diag.ok },
      },
      command = {
        a = { bg = c.syn.operator, fg = c.ui.bg, gui = "bold" },
        b = { bg = c.ui.bg, fg = c.syn.operator },
      },
      visual = {
        a = { bg = c.syn.keyword, fg = c.ui.bg, gui = "bold" },
        b = { bg = c.ui.bg, fg = c.syn.keyword },
      },
      replace = {
        a = { bg = c.syn.constant, fg = c.ui.bg, gui = "bold" },
        b = { bg = c.ui.bg, fg = c.syn.constant },
      },
      inactive = {
        -- Inactive statusline: a uniform mid-tone bar that sits clearly above
        -- the editor bg (sumiInk3 #1F1F28) so split boundaries stay obvious,
        -- yet stays dimmer than the active bar (sumiInk6 #54546D).
        a = { bg = p.sumiInk5, fg = p.fujiGray },
        b = { bg = p.sumiInk5, fg = p.fujiGray },
        c = { bg = p.sumiInk5, fg = p.oldWhite },
      },
    }

    return {
      options ={
      icons_enabled = true,
      theme = theme,
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
      },
      sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {
          { "filename", path = 1 },
        },
          lualine_x = {
          { "encoding" },
          { "fileformat" },
        },
          lualine_y = {
          {'progress'},
          {'location'},
        },
          lualine_z = {
          {'lsp_status'},
        },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {
              {"%n"},
              {"filename", path = 1},
        },
          lualine_x = {
          { "encoding" },
          { "fileformat" },
        },
          lualine_y = {
          {'progress'},
          {'location'},
        },
          lualine_z = {
          {'lsp_status'},
        },
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
  end
}
