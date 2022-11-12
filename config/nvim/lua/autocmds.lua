-- reload nvim on write
vim.api.nvim_exec(
  [[
  augroup ReloadConfig
    autocmd!
    autocmd BufWritePost init.lua,plugins.lua luafile %
  augroup END
]],
  false
)

-- compile packer on write
vim.cmd([[ autocmd BufWritePost plugins.lua PackerCompile ]])

-- automatically copy from '+' into system clipboard
vim.cmd([[ autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | OSCYankReg + | endif ]])
