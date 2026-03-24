--
-- Auto commands
--

vim.cmd([[
" Put these in an autocmd group, so that we can delete them easily.
augroup CursorLine   " Toggle cursorline on/off
    au!
    autocmd WinEnter,InsertLeave * set cursorline
    autocmd WinLeave,InsertEnter * set nocursorline
augroup END

"augroup WinBackground   " Toggle window background
"    au!
"    autocmd WinEnter * setlocal wincolor=
"    autocmd WinLeave * setlocal wincolor=MyNormalNC
"augroup END

augroup SyntaxHighlighting   " Syntax highlighting settings
    au!
    au BufEnter * syn sync fromstart
augroup END

augroup FileTypeSettings " File type settings
    " shiftwidth == sw, softtabstop == sts, expandtab == et
    " formatoptions == fo, iskeyword == isk, textwidth == tw
    au!
    autocmd FileType python setlocal tw=80 sw=4 sts=4 et fo-=t cc=99 "foldtext=PythonFoldText()
    autocmd FileType javascript setlocal tw=80 ts=4 sw=4 sts=4 et fo-=t isk+="-,"
    autocmd FileType css setlocal tw=80 sw=4 sts=4 et fo-=t
    autocmd FileType html setlocal tw=80 sw=2 sts=2 et fo-=t
    autocmd FileType sql setlocal tw=80 et fo-=t
    autocmd FileType rst setlocal tw=70 sw=2 sts=2 et fo+=t
    autocmd FileType tcl setlocal tw=80 sw=4 sts=4 et fo-=t
    autocmd FileType markdown setlocal tw=80 sw=2 sts=2 et fo+=t
    autocmd FileType terraform setlocal tw=80 sw=2 sts=2 et isk+=-
augroup END

augroup OnQuit
    au!
    " Close Vim if the last window is quickfix
    autocmd BufEnter *
                \ if &buftype=="quickfix" && winbufnr(2) == -1 |
                \   quit! |
                \ endif
augroup END

" Remove any trailing whitespace (except when the file is binary or when doing a merge)
augroup TrailingWhiteSpaces
    au!
    autocmd BufWritePre,FileWritePre * if !&bin && !&diff | %s/\s\+$//e | endif
augroup END

" Dynamically disable smartcase when entering command mode, so that both
" 'verylon<TAB>' and 'verylo<TAB>' -> 'VeryLongco<TAB>' work as desired.
" It assumes that both ignorecase and smartcase are already set.
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" Automatically close loclist when buffer is closed
augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

]])

