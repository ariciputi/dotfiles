vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.options')
require('config.keymaps')
require('config.abbreviations')
require('config.misc')
require('config.lazy')
require('config.autocmd')

vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme kanagawa-wave")

-- enable LSP for my main languages
-- for further details see:
-- https://lsp-zero.netlify.app/docs/
-- https://vonheikemen.github.io/learn-nvim/
vim.lsp.enable("pylsp")
vim.lsp.enable("fsautocomplete")

-- TODO
-- plugins to try:
-- https://github.com/lukas-reineke/lsp-format.nvim
