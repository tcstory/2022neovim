local on_attach = function (bufnr)
  local ntapi = require('nvim-tree.api')

  vim.keymap.set("n", "s", function ()
    ntapi.node.open.horizontal()
  end, { buffer = bufnr, noremap = true })


  vim.keymap.set("n", "v", function ()
    ntapi.node.open.vertical()
  end, { buffer = bufnr, noremap = true })
end

require("nvim-tree").setup({
  on_attach = on_attach,
  remove_keymaps = {"<C-v>", "<C-x>"}
})

vim.keymap.set('n', '<Leader>1', '<Cmd>NvimTreeFocus<CR>')

