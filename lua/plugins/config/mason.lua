local M = {}

M.servers = {
  "bash",
  "c",
  "cmake",
  -- "css",
  -- "dockerfile",
  -- "go",
  -- "html",
  -- "json",
  "lua",
  "python",
  "rust",
  -- "tailwindcss",
  "typescript",
  "vim",
  -- "yaml"
}

M.config = {
  ensure_installed = M.servers,
  max_current_installed = 10,
}

return M