return {
    {
       'neovim/nvim-lspconfig',
       dependencies = { 'saghen/blink.cmp' },

       -- -- example using `opts` for defining servers
       -- opts = {
       --   servers = {
       --     pylsp = {},
       --     fsautocomplete = {},
       --   },
       -- },
       -- -- example calling setup directly for each LSP
       -- config = function()
       --   local capabilities = require('blink.cmp').get_lsp_capabilities()
       --   local lspconfig = vim.lsp.config()

       --   lspconfig['pylsp'].setup({ capabilities = capabilities })
       --   lspconfig['fsautocomplete'].setup({ capabilities = capabilities })
       -- end
    },
}
