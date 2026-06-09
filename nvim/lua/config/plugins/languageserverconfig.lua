return {
    {
       'neovim/nvim-lspconfig',
       dependencies = {
         {
           'saghen/blink.cmp',
           version = '1.*',
           opts = {
             keymap = {
               ['<Tab>'] = { 'show', 'select_next', 'fallback' },
               ['<S-Tab>'] = { 'select_prev', 'fallback' },
               ['<CR>'] = { 'accept', 'fallback' },
               ['<C-e>'] = { 'cancel', 'fallback' },
             },
             completion = {
               trigger = {
                 show_on_insert_on_trigger_character = false,
                 show_on_keyword = false,
               },
               list = {
                 selection = { preselect = false, auto_insert = true },
               },
             },
             sources = {
               default = { 'buffer', 'lsp' },
             },
             signature = {
               enabled = true,
             },
           },
         },
       },
       config = function()
         local capabilities = require('blink.cmp').get_lsp_capabilities()

         vim.lsp.config('*', { capabilities = capabilities })
         vim.lsp.config('fsautocomplete', {
           cmd = { vim.fn.expand('~/.dotnet/tools/fsautocomplete'), '--adaptive-lsp-server-enabled' },
           -- Neovim's semantic-token highlighting spins the main loop at 100%
           -- CPU indefinitely on large F# files (Neovim 0.12 + FSAC's large
           -- token set), even after FSAC itself goes idle. Deleting the
           -- provider in on_attach is the documented opt-out (see
           -- :h vim.lsp.semantic_tokens.start); stop() tears down the
           -- highlighter if it already started. Tree-sitter coloring and every
           -- functional LSP feature (completion, signature help, inlay hints,
           -- hover, go-to-def, diagnostics, rename) stay intact.
           on_attach = function(client, bufnr)
             client.server_capabilities.semanticTokensProvider = nil
             pcall(vim.lsp.semantic_tokens.stop, bufnr, client.id)
           end,
           -- FSAC's UnusedOpens/SimplifyName analyzers enumerate the contents
           -- of every opened namespace. On large dependency graphs (e.g. AWS
           -- CDK / jsii bindings) this pegged a CPU core for ~6 min on file
           -- open. Disabling just these two drops load to ~5s while keeping
           -- unused-declaration, lint, and unnecessary-parentheses warnings,
           -- plus all core LSP features.
           settings = {
             FSharp = {
               UnusedOpensAnalyzer = false,
               SimplifyNameAnalyzer = false,
             },
           },
         })

         vim.lsp.inlay_hint.enable(true)

         vim.lsp.enable('pylsp')
         vim.lsp.enable('fsautocomplete')
       end
    },
}
