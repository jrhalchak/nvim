-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local isMac = vim.loop.os_uname().sysname == "Darwin"
-- Silent keymap option
local opts = { silent = true }

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

--Remap space as leader key
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- Resize windows w/ arrows
map('n', '<up>', ':resize -2<CR>', opts)
map('n', '<down>', ':resize +2<CR>', opts)
map('n', '<left>', ':vertical resize -2<CR>', opts)
map('n', '<right>', ':vertical resize +2<CR>', opts)

-- Clear search highlighting with <leader> and c
map('n', '<leader>h', ':nohl<CR>')

-- @todo Is this helpful?
-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Navigate buffers
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)

if isMac then
	-- Navigate tabs
  map('n', 'Ò', ':tabn<CR>', opts)
  map('n', 'Ó', ':tabp<CR>', opts)

  -- Move text up and down
  map('n', '∆', '<Esc>:m .+1<CR>==gi', opts)
  map('n', '˚', '<Esc>:m .-2<CR>==gi', opts)
else
	-- Navigate tabs
  map('n', '<A-L>', ':tabn<CR>', opts)
  map('n', '<A-H>', ':tabp<CR>', opts)

  -- Move text up and down
  map('n', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
  map('n', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
end

-- Fast saving with <leader> and s
-- map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
-- map('n', '<leader>q', ':qa!<CR>')

-- Close buffers
map('n', '<C-Q>', '<cmd>Bdelete!<CR>', opts)

-- Close windows
map('n', '<S-q>', '<cmd>q<CR>', opts)

-- Remap ; to : in visual mode
map('v', ';', ':')

-- Yank from the cursor to the end of the line, to be consistent with C and D
map('v', 'Y', 'y$')

-- Code folding options
-- TODO: these need changed because of 'o' for blank new line

map('v', '<leader>f0', ':set foldlevel=0<CR>')
map('v', '<leader>f1', ':set foldlevel=1<CR>')
map('v', '<leader>f2', ':set foldlevel=2<CR>')
map('v', '<leader>f3', ':set foldlevel=3<CR>')
map('v', '<leader>f4', ':set foldlevel=4<CR>')
map('v', '<leader>f5', ':set foldlevel=5<CR>')
map('v', '<leader>f6', ':set foldlevel=6<CR>')
map('v', '<leader>f7', ':set foldlevel=7<CR>')
map('v', '<leader>f8', ':set foldlevel=8<CR>')
map('v', '<leader>f9', ':set foldlevel=9<CR>')

-- Horizontal scrolling helper
map('v', 'zl', 'zL')
map('v', 'zh', 'zH')

-- Helper for saving files
map('n', '<C-S>', ':update<CR>')
map('v', '<C-S>', '<C-C>:update<CR>')
map('i', '<C-S>', '<C-O>:update<CR>')

-- " Shortcuts
-- " Change Working Directory to that of the current file
map('c', 'cwd', 'lcd %:p:h')
map('c', 'cd.', 'lcd %:p:h')

-- Helper for sync scrolling and Diffing
-- Mark current buffer for syncing view
map('n', '<leader>wv', ':set scb<CR>')
-- Mark current buffer for diffing
map('n', '<leader>wd', ':diffthis<CR>')

-- Better paste
map('v', "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Close Tab
-- map("n", "<leader>gq", "<cmd>:tabclose<CR>", opts)

-- Comment
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
map("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
-- map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- map("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- map("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
-- TODO: Need to respect local lint config or rules in lsp config?
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>')        -- toggle
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- Symbols Outline
map("n", "<leader>s", ":SymbolsOutline<CR>", opts)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
map("n", "<leader>fp", ":Telescope projects<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
-- map("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Git Copilot
map("n", "<leader>gc", ":Copilot panel<CR>", opts)

-----------------------------------------------------------
-- LSP Keymaps in ../lsp/lspconfig.lua
-----------------------------------------------------------

