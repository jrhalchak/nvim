-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number
opt.showmatch = true        -- Highlight matching parenthesis
-- opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global statusline
opt.relativenumber = true           -- Show line number

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift 4 spaces when tab
opt.tabstop = 2             -- 1 tab == 4 spaces
opt.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event

-----------------------------------------------------------
-- Migrated
-----------------------------------------------------------
opt.backup = false                           -- creates a backup file
opt.background = 'dark'                      -- set background for colorscheme
opt.cmdheight = 1                            -- more space in the neovim command line for displaying messages
opt.completeopt = { 'menuone', 'noselect' }  -- mostly just for cmp
opt.conceallevel = 0                         -- so that `` is visible in markdown files
opt.fileencoding = 'utf-8'                   -- the encoding written to a file
opt.hlsearch = true                          -- highlight all matches on previous search pattern
opt.pumheight = 10                           -- pop up menu height
opt.showmode = false                         -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2                          -- always show tabs
opt.timeoutlen = 1000                        -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true                          -- enable persistent undo
opt.writebackup = false                      -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
opt.expandtab = true                         -- convert tabs to spaces
opt.cursorline = true                        -- highlight the current line
opt.showcmd = false                          -- hide (partial) command in the last line of the screen (for performance)
opt.ruler = false                            -- hide the line and column number of the cursor position
opt.numberwidth = 4                          -- minimal number of columns to use for the line number {default 4}
opt.signcolumn = "yes"                       -- always show the sign column, otherwise it would shift the text each time
opt.scrolloff = 8                            -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8                        -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
opt.guifont = "monospace:h17"                -- the font used in graphical neovim applications
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 999
-- TODO: This isn't the proper place to set this
-- nofoldenable = true

-- Sub options
opt.fillchars.eob=' '                        -- show empty lines at the end of a buffer as ` ` {default `~`}
opt.shortmess:append 'c'                     -- hide all the completion messages, e.g. '-- XXX completion (YYY)', 'match 1 of 2', 'The only match', 'Pattern not found'
opt.whichwrap:append('<,>,[,],h,l')          -- keys allowed to move to the previous/next line when the beginning/end of line is reached
-- opt.iskeyword:append('-')                    -- treats words with `-` as single words
opt.formatoptions:remove({ 'c', 'r', 'o' })  -- This is a sequence of letters which describes how automatic formatting is to be done

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append 'sI'

-- -- Disable builtin plugins
local disabled_built_ins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'tutor',
  'rplugin',
  'synmenu',
  'optwin',
  'compiler',
  'bugreport',
  'ftplugin',
}

for _, plugin in pairs(disabled_built_ins) do
   g['loaded_' .. plugin] = 1
end
