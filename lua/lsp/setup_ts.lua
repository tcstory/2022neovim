local utils = require('lsp.utils')
local attach = require('lsp.on_attach')
local capabilities = require('lsp.capabilities')

require'lspconfig'.tsserver.setup{
  on_attach = attach.on_attach,
  flags = attach.lsp_flags,
  capabilities = capabilities,
  on_new_config = function (new_config, new_root_dir)
    new_config.init_options.tsserver = {
      path = utils.get_typescript_server_path(new_root_dir)
    }
  end
}
