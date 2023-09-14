local config = require("custom.lsp")

local config = {
  on_attach = config.on_attach,
  capabilities = config.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 10000,
        preloadFileSize = 1000,
      }
    }
  }
}

return config