vim.cmd('syntax enable')

vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = 'extends:❯,precedes:❮,tab:▸ ,trail:˽'
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.updatetime = 1000
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true


vim.g.mapleader = ' '
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>h', '<C-w>h')
vim.keymap.set('n', '<Leader>l', '<C-w>l')

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'h-hg/fcitx.nvim'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'kyazdani42/nvim-web-devicons'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)

require('plugin-config.nvim-treesitter')
