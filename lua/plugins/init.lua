local lazip = require "lua.plugins.lazip".lazip
local plugins = {
  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    lazy = true,
    dependencies = "mason.nvim",
    config = function()
      lazip("mason-lspconfig", {})
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = { "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
    build = function()
      pcall(function()
        require("mason-registry").refresh()
      end)
    end,
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "mason-lspconfig.nvim", "nlsp-settings.nvim" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require("plugins.config.treesiter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    opts = function()
      return require("plugins.config.dashboard")
    end,
    config = function(_, opts)
      lazip("dashboard", opts)
    end
  },
  {
    "alvarosevilla95/luatab.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
      lazip("luatab", opts)
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    keys = {
      { "<C-n>",     "<cmd>NvimTreeToggle<CR>", desc = "toggle nvimtree" },
      { "<leader>e", "<cmd>NvimTreeFocus<CR>",  desc = "focus nvimtree" }
    },
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose" },
    opts = function()
      require("plugins.config.nvimtree")
    end,
    config = function(_, opts)
      lazip("nvim-tree", opts)
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    lazy = false,
    priority = 1000,
    opts = function()
      return require("plugins.config.lualine")
    end,
    config = function(_, opts)
      lazip("lualine", opts)
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = { { "nvim-lua/plenary.nvim" } },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "help tags" }
    },
    opts = function()
      return require("plugins.config.telescope")
    end,
    config = function(_, opts)
      lazip("telescope", opts)
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end
  },
  { "utilyre/barbecue.nvim", },
  { "smiteshp/nvim-navic", },
  { "tamago324/nlsp-settings.nvim", cmd = "LspSettings", lazy = true },
}

require("lazy").setup(plugins)