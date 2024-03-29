vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  --use {
  --  "ellisonleao/gruvbox.nvim",
  --  config = [[require('config.gruvbox')]]
  --}
  use { "catppuccin/nvim", as = "catppuccin", config = [[require('config.catppuccin')]] }
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

  use 'JuliaEditorSupport/julia-vim'

  -- LSP stuff habibi
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'mfussenegger/nvim-dap'},
      {'jay-babu/mason-nvim-dap.nvim'},
      {'rcarriga/nvim-dap-ui'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  use('mbbill/undotree')

  use {
    "windwp/nvim-autopairs",
    config = [[require('config.autopairs')]]
  }

  use 'folke/tokyonight.nvim'

end)
