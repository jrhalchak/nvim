-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: lazy.nvim
-- URL: https://github.com/folke/lazy.nvim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Start setup
lazy.setup({
  spec = {
    -- Colorscheme:
    -- The colorscheme should be available when starting Neovim.
    {
      -- 'loctvl842/monokai-pro.nvim',
      'folke/tokyonight.nvim',
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
    },

    -- Icons
    { 'nvim-tree/nvim-web-devicons', lazy = true },

    -- Dashboard (start screen)
    {
      'goolord/alpha-nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Misc
    {
      'simrat39/symbols-outline.nvim',
      config = function()
        require('symbols-outline').setup {}
      end,
    },

    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup {}
        -- TODO: You can do custom
        --   pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        -- }
      end,
      dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    },

    { 'JoosepAlviste/nvim-ts-context-commentstring' },

    { 'sindrets/diffview.nvim' },

    -- Git labels
    {
      'lewis6991/gitsigns.nvim',
      lazy = true,
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
      }
    },

    -- File explorer
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Statusline
    {
      'nvim-lualine/lualine.nvim',
      lazy = false,
      priority = 1000,
      dependencies = {
        'nvim-tree/nvim-web-devicons',
        'lewis6991/gitsigns.nvim',
      },
    },

    -- Telescope
    { "nvim-telescope/telescope.nvim" },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- Indent line
    { 'lukas-reineke/indent-blankline.nvim' },

    -- Autopair
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('nvim-autopairs').setup{}
      end
    },

    -- DAP
    -- { "mfussenegger/nvim-dap" },
    -- { "rcarriga/nvim-dap-ui" },
    -- { "ravenxrz/DAPInstall.nvim" },

    -- LSP
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'alexaandru/nvim-lspupdate' },
    { 'neovim/nvim-lspconfig' },
    {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        local null_ls = require "null-ls"

        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        local formatting = null_ls.builtins.formatting
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        local diagnostics = null_ls.builtins.diagnostics

        -- https://github.com/prettier-solidity/prettier-plugin-solidity
        null_ls.setup {
          debug = false,
          sources = {
            require('typescript.extensions.null-ls.code-actions'),
            null_ls.builtins.code_actions.gitsigns,
            formatting.prettier.with {
              extra_args = { "--single-quote" },
            },
            formatting.black.with { extra_args = { "--fast" } },
            formatting.stylua,
            formatting.google_java_format,
            diagnostics.flake8,
          },
        }
      end,
      dependencies = {
        'jose-elias-alvarez/typescript.nvim',
        'lewis6991/gitsigns.nvim'
      },
    },

    { 'jose-elias-alvarez/typescript.nvim' },

    -- Highlight duplicates of active fragment
    { 'RRethy/vim-illuminate' },

    -- Buffers
    { 'moll/vim-bbye' },

    -- Autocomplete
    {
      'hrsh7th/nvim-cmp',
      -- load cmp on InsertEnter
      event = 'InsertEnter',
      -- these dependencies will only be loaded when cmp loads
      -- dependencies are always lazy-loaded unless specified otherwise
      dependencies = {
        'onsails/lspkind.nvim',
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
      },
    },
    { 'onsails/lspkind.nvim' },

    {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      event = 'InsertEnter',
      config = function()
        require('copilot').setup {
          suggestion = { enabled = false },
          panel = { enabled = false },
        }
      end,
    },
    {
      -- 'github/copilot.vim'
      'zbirenbaum/copilot-cmp',
      after = {
        'zbirenbaum/copilot.lua'
      },
      config = function()
        require("copilot_cmp").setup {}
      end,
    },
  },
})
