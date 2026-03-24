-- Toggle spell checking
vim.keymap.set("n", "<leader>sp", "<cmd>setlocal spell! spelllang=en_us<CR>")

-- Toggle search highlighting
vim.keymap.set("n", "<leader>hh", "<cmd>set hlsearch! hlsearch?<CR>", {silent=true})

-- Highlight current word
-- vim.keymap.set("n", "<leader>hw", ':let @/=\'\<<C-R>=expand("<cword>")<CR>\>\'<CR>:set hls<CR>')

vim.cmd([[
" Highlight current word
nnoremap <Leader>hw :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
]])

-- Remap CTRL-I and CTRL-O
-- (since CTRL-I is <Tab> and the latter is taken by SuperTab plugin)
vim.cmd([[
nnoremap i <C-I>
nnoremap o <C-O>
]])

-- Show invisible character
vim.keymap.set("n", "<leader>hi", "<cmd>set list! list?<CR", {silent=true})

-- Toggle relative line numbers
vim.keymap.set("n", "<leader>rr", "<cmd>set relativenumber! number!<CR>", {silent=true})

-- Map window management shortcut
vim.keymap.set("n", "<leader>wh", "<C-w>h", {silent=true})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {silent=true})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {silent=true})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {silent=true})
vim.keymap.set("n", "<leader>wq", "<C-w>q", {silent=true})

vim.keymap.set("n", "<leader>w=", "<C-w>=", {silent=true})
vim.keymap.set("n", "<leader>w_", "<C-w>_", {silent=true})
vim.keymap.set("n", "<leader>w-", "<C-w>-", {silent=true})
vim.keymap.set("n", "<leader>w+", "<C-w>+", {silent=true})
vim.keymap.set("n", "<leader>w<", "<C-w><", {silent=true})
vim.keymap.set("n", "<leader>w>", "<C-w>>", {silent=true})
vim.keymap.set("n", "<leader>ws", "<C-w>s", {silent=true})
vim.keymap.set("n", "<leader>wv", "<C-w>v", {silent=true})
vim.keymap.set("n", "<leader>wo", "<C-w>o", {silent=true})
vim.keymap.set("n", "<leader>wc", "<C-w>c", {silent=true})
vim.keymap.set("n", "<leader>wz", "<C-w><C-z>", {silent=true})

vim.keymap.set("n", "<Tab>", "<C-w>w", {silent=true})
vim.keymap.set("n", "<S-Tab>", "<C-w>W", {silent=true})

-- Close localfix and quickfix buffers
vim.keymap.set("n", "<leader>lc", "<cmd>lclose<CR>", {silent=true})
vim.keymap.set("n", "<leader>lo", "<cmd>lopen<CR>", {silent=true})
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", {silent=true})
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", {silent=true})

-- Close buffer
vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<CR>", {silent=true})
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", {silent=true})
vim.keymap.set("n", "<leader>bN", "<cmd>bNext<CR>", {silent=true})
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", {silent=true})

-- Open files shortcuts
vim.keymap.set("n", "<leader>ee", ':e <C-R>=expand("%:h") . "/"<CR>')
vim.keymap.set("n", "<leader>ed", "<cmd>e %:p:h<CR>")
vim.keymap.set("n", "<leader>en", "<cmd>new<CR>")

-- Readline-like movements on the command line
vim.cmd([[
cnoremap <C-a> <Home>
cnoremap <C-d> <Delete>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <M-d> <S-Right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-Right><Delete>
cnoremap <C-g> <C-c>
]])
