local utils = require('lsp.utils')
local attach = require('lsp.on_attach')
local capabilities = require('lsp.capabilities')

require'lspconfig'.volar.setup{
  on_attach = attach.on_attach,
  flags = attach.flags,
  capabilities = capabilities,
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = utils.get_typescript_server_path(new_root_dir)
  end,
}
