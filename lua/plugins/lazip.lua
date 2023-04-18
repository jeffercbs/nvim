local M = {}

M.lazip = function(name, opts)
  local err, plugin = pcall(require, name)
  if not err then
    return
  end
  plugin.setup(opts)
end

return M