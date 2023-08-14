local status_ok, tabby = pcall(require, "tabby.tabline")
if not status_ok then
	return
end

-- Set colorscheme (from core/colors.lua/colorscheme_name)
local colors = require('core/colors').tabby

local function contains_nvim_tree(name)
  return string.find(name, 'NvimTree')
end

local function tab_name(tab)
  local name = tab.name()
  -- TODO: has to be a better way to break
  local replaced = false

  if contains_nvim_tree(name) then
    tab.wins().foreach(function(win)
      local buffer_name = win.buf_name()
      if not contains_nvim_tree(buffer_name) and not replaced then
        name = buffer_name
        replaced = true
      end
    end)
  end

  return string.gsub(name,"%[..%]","")
end

-- local function tab_modified(tab)
--     local wins = require("tabby.module.api").get_tab_wins(tab)
--     for _, x in pairs(wins) do
--         if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
--             return ""
--         end
--     end
--     return " "
-- end

local function lsp_diag(buf)
    if buf ~= nil then return " " end

    local diagnostics = vim.diagnostic.get(buf)
    local count = {0, 0, 0, 0}

    for _, diagnostic in ipairs(diagnostics) do
        count[diagnostic.severity] = count[diagnostic.severity] + 1
    end
    if count[1] > 0 then
        return vim.bo[buf].modified and "" or ""
    elseif count[2] > 0 then
        return vim.bo[buf].modified and "" or ""
    end

    return vim.bo[buf].modified and "" or " "
    -- ""
end

-- HEX codes from vscode.vim's lualine theme
local theme = {
  fill = { bg=colors.fillbg, fg=colors.fillfg },
  head = { bg=colors.headbg, fg=colors.headfg },

  current_tab = { bg=colors.currenttabbg, fg=colors.currenttabfg, style=colors.currenttabstyle },
  inactive_tab = { bg=colors.inactivetabbg, fg=colors.inactivetabfg },

  tail = { bg=colors.tailbg, fg=colors.tailfg },
}

require('tabby.tabline').set(function(line)
  return {
    {
      { ' 裡', hl = theme.head },
      line.sep('', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.inactive_tab
      return {
        line.sep('', hl, theme.fill),
        tab.number(),
        "",
        tab_name(tab),
        "",
        -- tab_modified(tab.id),
        lsp_diag(tab.id),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    {
      line.sep('', theme.tail, theme.fill),
      { '  ', hl = theme.tail },
    },
    hl = theme.fill,
  }
end)
