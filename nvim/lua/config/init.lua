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

