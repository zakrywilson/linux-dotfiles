local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- non-plugin -----------------------------------------------------------------

map("n", "<leader>.n", ":e ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true, nowait = true })
map("n", "<leader>.t", ":e ~/.tmux.conf<CR>", { noremap = true, silent = true, nowait = true })
map("v", "<leader>y", '"+y', { noremap = false, silent = true, nowait = true })
map("n", "<leader>y", 'V"+y', { noremap = false, silent = true, nowait = true })
map("n", "<Esc>", ":noh<CR>", { noremap = false, silent = false, nowait = true })
map('n', '<Leader>s', ':w<CR>', { noremap = true, silent = true, nowait = true })


-- plugins --------------------------------------------------------------------

-- vim-easymotion
vim.cmd([[
  nmap s <Plug>(easymotion-s2)
  map <leader>j <Plug>(easymotion-j)
  map <leader>k <Plug>(easymotion-k)
]])

-- vim-commentary
map("v", "<leader>/", "gc", { noremap = false, silent = true, nowait = true })
map("n", "<leader>/", "gcc", { noremap = false, silent = true, nowait = true })

-- FZF
map("n", "<leader>ob", ":Buffers<CR>", { noremap = true, silent = true, nowait = true })
map("n", "<leader>of", ":FZF<CR>", { noremap = true, silent = true, nowait = true })
map("n", "<leader>or", ":Files %:p:h<CR>", { noremap = true, silent = true, nowait = true })
map("n", "<leader>th", ":Colors<CR>", { noremap = true, silent = true, nowait = true })
