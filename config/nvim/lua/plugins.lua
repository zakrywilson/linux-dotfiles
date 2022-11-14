local packer = require("packerinit")

local use = packer.use

return packer.startup(function()


  -- required -----------------------------------------------------------------

  use { "nvim-lua/plenary.nvim" }

  use { "wbthomason/packer.nvim" }


  -- general ------------------------------------------------------------------

  use { -- TODO: configure with lsp
    "RRethy/vim-illuminate",
    event = "BufEnter",
    config = function() vim.g.Illuminate_delay = 500 end,
    providers = {
      'lsp',
      'treesitter',
      'regex',
    },
  }

  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }

  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup {
        size = function(term)
          if term.direction == "horizontal" then
            return 20
          elseif term.direction == "vertical" then
            return vim.api.nvim_win_get_width("%") / 2
          end
        end,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_terminals = false,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        float_opts = {
          border = "rounded",
          width = function()
            -- TODO: fix
            -- return vim.api.nvim_win_get_width(0) - 25
            return 250
          end,
          height = function()
            -- TODO: fix
            -- return vim.api.nvim_win_get_height("%") - 25
            return 100
          end,
          winblend = 20,
          highlights = {
            border = "Comment",
            background = "Normal",
          },
        },
      }
     end
   }

   use {
     "easymotion/vim-easymotion",
     event = "BufEnter",
     config = function()
       vim.g.EasyMotion_do_mapping = 0 -- Disable default mappings
       vim.g.EasyMotion_smartcase = 1
       vim.g.EasyMotion_use_upper = 1
       vim.g.EasyMotion_keys = "STIORAMVCXZDHYWUFLPKBQJGNE" -- nice for Colemak
       vim.g.EasyMotion_force_csapprox = 1
       vim.g.EasyMotion_space_jump_first = 1
       vim.g.EasyMotion_enter_jump_first = 1
       vim.g.EasyMotion_disable_two_key_combo = 1
     end
   }

-- use { "famiu/bufdelete.nvim" }

-- use { "henriquehbr/nvim-startup.lua" }

   use { "junegunn/fzf", event = "BufEnter", run = "./install --bin" }

   use {
     "junegunn/fzf.vim",
     event = "BufEnter",
     config = function()
       vim.cmd([[
         let g:fzf_colors = {
           \ 'fg':      ['fg', 'Normal'],
           \ 'bg':      ['bg', 'Normal'],
           \ 'hl':      ['fg', 'Comment'],
           \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
           \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
           \ 'hl+':     ['fg', 'Statement'],
           \ 'info':    ['fg', 'PreProc'],
           \ 'border':  ['fg', 'Ignore'],
           \ 'prompt':  ['fg', 'Conditional'],
           \ 'pointer': ['fg', 'Exception'],
           \ 'marker':  ['fg', 'Keyword'],
           \ 'spinner': ['fg', 'Label'],
           \ 'header':  ['fg', 'Comment'] }
         let g:fzf_preview_window = ['up:60%', 'ctrl-/']
         " Rg
         command! -bang -nargs=* Rg
           \ call fzf#vim#grep(
           \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
           \   fzf#vim#with_preview(), <bang>0)
         " Buff
         command! -bang Buffers
           \ call fzf#vim#buffers(fzf#vim#with_preview(), <bang>0)
       ]])
     end
   }

-- use { "kamykn/spelunker.vim", event = "BufEnter" }

-- use { "karb94/neoscroll.nvim" }

-- use { "lukas-reineke/indent-blankline.nvim" }

-- use { "mchughj/vim-mercurial", event = "BufEnter" }

   use {
     "mhinz/vim-signify",
     event = "VimEnter",
     config = function()
       vim.g.signify_vcs_list = { "git" }
       vim.g.signify_sign_change = "*"
       vim.g.signify_sign_delete = "-"
     end
   }

-- use { "mizlan/iswap.nvim" }

   use { "norcalli/nvim-colorizer.lua", event = "BufEnter" }

-- use { "ntpeters/vim-better-whitespace", event = "BufEnter"  }

   use { "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "comment",
          "css",
          "go",
          "html",
          "java",
          "javascript",
          "json",
          "lua",
          "python",
          "rasi",
          "regex",
          "toml",
          "typescript",
        },
        highlight = {
          enable = true,
          disable = {},
        },
      })
    end
  }

-- use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }

  use { "ojroques/vim-oscyank" }

-- use { "Pocco81/TrueZen.nvim" }

  use { "tpope/vim-commentary", event = "VimEnter" }

  use { "tpope/vim-surround", event = "VimEnter" }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  }


  -- appearance ---------------------------------------------------------------

  use { "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italics"
          }
        }
      })
    end
  }

  use { "ackyshake/Spacegray.vim" }

  use { "folke/tokyonight.nvim" }

  use { "jacksonludwig/vim-earl-grey" }

  use { "lifepillar/vim-solarized8" }

  use { "sainnhe/everforest" }

  use { "savq/melange" }

  -- use { "shaunsingh/nord.nvim" }


  -- lsp ----------------------------------------------------------------------

  use { "neovim/nvim-lspconfig" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/nvim-cmp" }
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }

  -- lua ----------------------------------------------------------------------

  use { "euclidianAce/BetterLua.vim" }
  use { "folke/neodev.nvim" }

  -- use { "jose-elias-alvarez/null-ls.nvim" }

end)
