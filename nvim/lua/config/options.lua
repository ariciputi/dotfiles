vim.opt.cursorline = true                  -- show the cursor line
vim.opt.tildeop = true                     -- set tilde as operator
vim.opt.scrolloff = 2                      -- keep always 2 lines of context when scrolling
vim.opt.clipboard = "unnamed"              -- share the clipboard with the OS

-- Set up tab stop machinery
vim.opt.shiftwidth = 4        -- set indetation to 4 characters
vim.opt.expandtab = true      -- expand <TAB> char to spaces

vim.opt.copyindent = true     -- copy the previous indentation on autoindenting

-- Set searching options
vim.opt.ignorecase = true          -- foo matches foo, Foo and FOO
vim.opt.smartcase = true           -- Foo matches Foo only

-- Folding settings
vim.opt.foldlevelstart = 99    -- Folding root level open

-- Invisible characters settings
vim.opt.listchars = "tab:>-,eol:¬,trail:~,nbsp:+"

-- Set complete option
vim.opt.completeopt = "longest,menu" -- the colors of the menu make it hard to read and almost useless

-- Wildmenu settings
vim.opt.wildmenu = true
vim.opt.wildmode = "longest,full"
vim.opt.wildignorecase = true
