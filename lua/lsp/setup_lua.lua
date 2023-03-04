local config = require('lsp.on_attach')

require('lspconfig').lua_ls.setup({
  on_attach = config.on_attach,
  flags = config.lsp_flags,
  settings = {}
})
