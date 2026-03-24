-- Something makes python setup very slow
vim.cmd([[
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
]])

-- Settings enabled only when vim is started from within pgsql
vim.cmd([[
if match(getcwd(), "/pgsql") >=0 ||  match(getcwd(), "/postgresql") >= 0
  set cinoptions=(0
  set tabstop=4
  set shiftwidth=4
  set noexpandtab
endif
]])
