-- add your own plugins
local plugins = {

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end
  },
  { "github/copilot.vim" },
}

local config = require("core").load_config()

if #config.default_plugins > 0 then
  table.insert(plugins, config.default_plugins)
end

require("lazy").setup(plugins, config.lazy_load)