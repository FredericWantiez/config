vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'neovim/nvim-lspconfig'
  use { 
    "ellisonleao/gruvbox.nvim",
    config = [[require('config.gruvbox')]]
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-lualine/lualine.nvim',
    config = [[require('config.lualine')]],
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim',
    config = [[require('config.telescope')]],
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
end)
