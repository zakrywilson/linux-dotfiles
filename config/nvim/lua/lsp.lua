local cmp = require('cmp')

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local function executable(name)
  if vim.fn.executable(name) > 0 then
    return true
  end
  return false
end

local select_opts = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python
if executable("pylsp") then
  lspconfig.pylsp.setup {
    settings = {
      pylsp = {
        plugins = {
          pylint = { enabled = true, executable = "pylint" },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          jedi_completion = { fuzzy = true },
          pyls_isort = { enabled = true },
          pylsp_mypy = { enabled = true },
        },
      },
    },
    flags = {
      debounce_text_changes = 200,
    },
    capabilities = capabilities,
  }
else
  vim.notify("pylsp not found!", vim.log.levels.WARN, { title = "Nvim-config" })
end

-- Lua
require("neodev").setup({})
if executable("lua-language-server") then
  -- Settings for lua-language-server can be found on https://github.com/sumneko/lua-language-server/wiki/Settings
  lspconfig.sumneko_lua.setup {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        completion = {
          callSnippet = "Replace"
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files,
          -- see also https://github.com/sumneko/lua-language-server/wiki/Libraries#link-to-workspace
          -- Lua-dev.nvim also has similar settings for sumneko lua, https://github.com/folke/lua-dev.nvim/blob/main/lua/lua-dev/sumneko.lua
          library = {
            vim.api.nvim_get_runtime_file('', true),
            vim.fn.stdpath("data") .. "/site/pack/packer/opt/emmylua-nvim",
            vim.fn.stdpath("config"),
          },
          maxPreload = 2000,
          preloadFileSize = 50000,
        },
      },
    },
    capabilities = capabilities,
  }
end
