local M = {}

local function call_module(name, opts)
    local ok, module = pcall(require, name)
    if ok then
        module.setup(opts)
    end
end

M.default = {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonUpdate", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
        lazy = true,
        opts = function()
            return require("plugins.config.mason").config
        end,
        config = function(_, opts)
            call_module("mason", opts)
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim" },
        config = function()
            require("plugins.config.lspconfig")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "rust" },
                auto_install = true,
                heilight = {
                    enable = true
                }
            })
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
            call_module("dashboard", opts)
        end
    },
    {
        "romgrk/barbar.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        init = function()
            vim.g.barbar_auto_setup = false
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
            call_module("nvim-tree", opts)
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
            call_module("lualine", opts)
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = { "Telescope" },
        dependencies = "nvim-lua/plenary.nvim",
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
            call_module("telescope", opts)
        end
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        dependencies = { "smiteshp/nvim-navic", "nvim-tree/nvim-web-devicons" },
        config = function()
            require("barbecue").setup()
        end
    },
}

return M