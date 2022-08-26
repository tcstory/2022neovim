local config = require('lsp.on_attach')

require('lspconfig').sumneko_lua.setup({
  on_attach = config.on_attach,
  flags = config.lsp_flags,
})
