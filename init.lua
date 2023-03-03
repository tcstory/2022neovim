vim.cmd('syntax enable')

vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = {
  tab = "▸ ",
  trail = "˽",
  extends = "❯",
  precedes = "❮",
};
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.updatetime = 1000
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cursorline = true


vim.g.mapleader = ' '
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>h', '<C-w>h')
vim.keymap.set('n', '<Leader>l', '<C-w>l')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'h-hg/fcitx.nvim',
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  'kyazdani42/nvim-web-devicons',
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('plugin-config.nvim-tree')
    end
  },
  {
    'feline-nvim/feline.nvim',
    config = function() 
      require('plugin-config.feline')
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugin-config.gitsigns')
    end
  },
  {
    "akinsho/toggleterm.nvim", 
    version = '*', 
    config = function()
      require('plugin-config.toggleterm')
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim', 
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
  },
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require('plugin-config.telescope')
    end
  }
})
