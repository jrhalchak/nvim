local settings = {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      version = 'LuaJIT',
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file("", true),
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
      enable = false,
    },
  },
  Typescript = {
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = true, -- enable debug logging for commands
    go_to_source_definition = {
      fallback = false, -- fall back to standard LSP definition on failure
    },
    server = { -- pass options to lspconfig's setup method
      init_options = {
        plugins = {
          {
            name = 'ts-lit-plugin',
            location = '/Users/jonathan.halchack/.nvm/versions/node/v18.14.2/lib/node_modules/ts-lit-plugin/'
          },
          {
            name = 'typescript-lit-html-plugin',
            location = '/Users/jonathan.halchack/.nvm/versions/node/v18.14.2/lib/node_modules/typescript-lit-html-plugin/'
          },
        },
      },
    }
  }
}

return settings
