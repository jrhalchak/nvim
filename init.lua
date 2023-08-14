--------------------------------
-- Neovim Config Init
-- JRHalchak
-- https://github.com/jrhalchak
--------------------------------

if vim.g.vscode then
  -- VSCode extension
  -- require('vsc-nvim')
else
  -- ordinary Neovim
  -- Import Lua modules
  require('core/lazy')
  require('core/colors')
  require('core/keymaps')
  require('core/autocmds')
  require('core/options')
  require('core/lualine')
  require('lsp/lspconfig')
  require('plugins/alpha-nvim')
  require('plugins/nvim-tree')
  require('plugins/indent-blankline')
  require('plugins/nvim-cmp')
  require('plugins/nvim-treesitter')
  require('plugins/telescope')
  -- require('plugins/tabby')
end

