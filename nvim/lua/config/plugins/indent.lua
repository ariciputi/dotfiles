return {
  'saghen/blink.indent',
  keys = {
      {"<leader>ti", function() local i = require('blink.indent'); i.enable(not i.is_enabled()) end },
  },
  opts = function(_, _)
    vim.g.indent_guide = false
  end
}
