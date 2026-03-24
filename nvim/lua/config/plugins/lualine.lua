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
  opts = {
      options ={
      icons_enabled = true,
      theme = 'auto',
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
}
