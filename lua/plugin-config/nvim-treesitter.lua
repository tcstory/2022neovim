require'nvim-treesitter.configs'.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {
    "bash",
    "css", 
    "html", 
    "json5", 
    "json", 
    "javascript", 
    "lua", 
    "typescript", 
    "tsx", 
    "markdown",
    "markdown_inline",
  },
  -- 启用代码高亮功能
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}

local highlighter = require "vim.treesitter.highlighter"

vim.api.nvim_create_autocmd({'BufNewFile', 'BufReadPost', 'FileReadPost'}, {
  group = vim.api.nvim_create_augroup('FoldMethod', {}),
  callback = function(ctx)
    if highlighter.active[ctx.buf] then
      -- 开启 Folding
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
      -- 默认不要折叠
      -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
      vim.wo.foldlevel = 99
    end

  end,
  pattern = "*",
})

