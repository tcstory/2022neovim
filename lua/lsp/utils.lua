local util = require 'lspconfig.util'

local M = {}

M.get_typescript_server_path = function(root_dir)

  local global_ts = util.path.join(vim.fn.stdpath('data'), 'mason', 'packages', 'typescript-language-server', 'node_modules', 'typescript', 'lib')
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

return M
