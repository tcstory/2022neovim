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

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'h-hg/fcitx.nvim'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'kyazdani42/nvim-web-devicons'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }
  use "EdenEast/nightfox.nvim"
  use {
    "nanozuki/tabby.nvim",
  }
  use 'feline-nvim/feline.nvim'
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      direction = 'float'
    })
  end}

  -- telescope start
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function ()
      require('telescope').load_extension('fzf')
    end
  }
-- telescope end

-- markdown start
  use {
    'preservim/vim-markdown',
    requires = { {'godlygeek/tabular'} }
  }
-- markdown end

-- lsp
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
use 'L3MON4D3/LuaSnip' -- Snippets plugin
use {
  "windwp/nvim-autopairs",
  config = function() require("nvim-autopairs").setup {} end
}
end)

-- theme
vim.cmd("colorscheme carbonfox")

require('plugin-config.nvim-treesitter')
-- require('plugin-config.netrw')
require('plugin-config.nvim-tree')
require('plugin-config.tabby')
require('plugin-config.feline')
require('plugin-config.gitsigns')
require('plugin-config.telescope')
require('lsp.setup')
