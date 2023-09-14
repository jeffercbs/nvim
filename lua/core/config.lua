local M = {}

M.default_plugins = require("core.plugins").default
M.lazy_load = require "plugins.config.lazy_nvim"

return M