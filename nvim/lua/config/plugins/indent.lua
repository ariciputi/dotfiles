return {
  'saghen/blink.indent',
  lazy = false,
  keys = {
      {"<leader>ti", function() require('blink.indent').enable(not require('blink.indent').is_enabled()) end },
  },
  config = function(_, _)
    vim.g.indent_guide = false
  end
  --- @module 'blink.indent'
  --- @type blink.indent.Config
  -- opts = {},
}
