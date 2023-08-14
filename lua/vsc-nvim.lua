-- TODO: get latest backup, do the vscode check, and export this to a module
-- or maybe just do all of it in vscode keybindings? probably just the conditional ones

-- TODO: Need open in split
-- TODO: Need tabbing to cycle through completion options and enter to select

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Remap space as leader key
-- vim.g.mapleader = ' '

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>")
map("n", "<C-j>", "<Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>")
map("n", "<C-k>", "<Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>")
map("n", "<C-l>", "<Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>")

map("x", "<C-h>", "<Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>")
map("x", "<C-j>", "<Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>")
map("x", "<C-k>", "<Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>")
map("x", "<C-l>", "<Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>")

-- Close, Save/Close File
map("n", "Q", "<Cmd>Wq<CR>")
map("n", "<C-Q>", "<Cmd>Quit!<CR>")

-- Clear search highlighting with <leader> and c
map('n', '<leader>h', ':nohl<CR>')

-- Open Explorer
-- I don't want to waste maps when a vscode binding is required so I'm going with words
-- map("n", "<leader>e", "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
-- See keybindings.jsonc
-- Remove this default keybinding
-- filesExplorer.openFilePreserveFocus
-- map("n", "<leader>E", "<Cmd>call VSCodeNotify('workbench.action.focusSideBar')<CR>")
-- map("n", "<leader>wl", "<Cmd>call VSCodeNotify('workbench.files.action.focusOpenEditorsView')<CR>")

-- Toggle outline: Expects secondary sidebar to contain outline
-- See keybindings.json
-- map("n", "<leader>s", "<Cmd>call VSCodeNotify('workbench.action.toggleAuxiliaryBar')<CR>")
-- alternately outline.toggleVisibility

-- Tab Navigation
-- TODO: Move this to keybindings so it works when not in an editor window
-- map("n", "<S-l>", "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>")
-- map("n", "<S-h>", "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>")
-- map("x", "<S-l>", "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>")
-- map("x", "<S-h>", "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>")

-- map("n", "<C-6>", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")

-- Line Moving
map("n", "<A-k>", "<Cmd>call VSCodeNotify('editor.action.moveLinesUpAction')<CR>")
map("n", "<A-j>", "<Cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<CR>")
map("x", "<A-k>", "<Cmd>call VSCodeNotify('editor.action.moveLinesUpAction')<CR>")
map("x", "<A-j>", "<Cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<CR>")

-- Diagnostics, Helpers, Tools
map("n", "<leader>rn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
map("n", "<leader>r", "<Cmd>call VSCodeNotify('editor.action.refactor')<CR>")
map("n", "<leader>k", "<Cmd>call VSCodeNotify('editor.action.triggerParameterHints')<CR>")

map("n", "<S-k>", "<Cmd>call VSCodeNotify('editor.action.showHover')<CR>")

map("n", "gD", "<Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- See keybindings.jsonc
-- map('n', '<C-f>', '<Nop>')
-- map("n", "<C-f>", "<Cmd>call VSCodeNotify('editor.action.scrollDownHover')<CR>")
-- map("n", "<C-d>", "<Cmd>call VSCodeNotify('editor.action.scrollUpHover')<CR>")
-- map("n", "<C-F>", "<Cmd>call VSCodeNotify('showNextParameterHint')<CR>")
-- map("n", "<C-D>", "<Cmd>call VSCodeNotify('showPrevParameterHint')<CR>")

-- Multiple Cursors
-- Will require vim plugin, see: https://github.com/vscode-neovim/vscode-neovim/issues/409#issuecomment-830796423
-- Found in: https://github.com/vscode-neovim/vscode-neovim/issues/97





