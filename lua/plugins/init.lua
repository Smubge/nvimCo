return
{
  {
     'numToStr/Comment.nvim',
     config = function()
        require('Comment').setup()
     end
   },
  {"wbthomason/packer.nvim"}, -- Have packer manage itself
  {"nvim-lua/popup.nvim"}, -- An implementation of the Popup API from vim in Neovim
  {"nvim-lua/plenary.nvim"}, -- Useful lua functions used ny lots of plugins
   {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'},
  {"windwp/nvim-autopairs"},
  --Gitsigns
   {"lewis6991/gitsigns.nvim"},
  --[[ use "numToStr/Comment.nvim" ]]
   {'kyazdani42/nvim-web-devicons'},
   {'kyazdani42/nvim-tree.lua'},
   {"simrat39/rust-tools.nvim"},
   { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" },
   { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" },

  --Colorschemes
  {"lunarvim/colorschemes"}, --A bunch of colorschemes yo ucan try out,
   {'folke/tokyonight.nvim'},
   {'catppuccin/nvim'},
  {'navarasu/onedark.nvim'},
  {'Mofiqul/dracula.nvim'},
  --CMP
 { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" }, -- The completion plugin
   { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
   { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }, -- path completions
	 { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }, -- snippet completions
	 { "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" },
	 { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" },  -- snippets
  {"L3MON4D3/LuaSnip"}, --snippet engine
  {"rafamadriz/friendly-snippets"}, -- a bunch of snippets to use,

	-- LSP
  {"neovim/nvim-lspconfig"}, -- enable LSP
   {'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim'},

  --Telescope
   {"nvim-telescope/telescope.nvim"},
   {'nvim-telescope/telescope-media-files.nvim'},

  --Treesitter
   {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
   {"p00f/nvim-ts-rainbow"},
   {"nvim-treesitter/playground"},
   {'JoosepAlviste/nvim-ts-context-commentstring'},

   {"Pocco81/auto-save.nvim"},
   { "mfussenegger/nvim-jdtls", ft = { "java" }},
   {"HiPhish/gradle.nvim"},
   {"akinsho/bufferline.nvim"},
   {"moll/vim-bbye"},
  --Buffers
  --Impatient
   {'lewis6991/impatient.nvim'},
 --Lualine
   {
  'nvim-lualine/lualine.nvim',
   dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
  },
  --ToggleTerm
  { "akinsho/toggleterm.nvim"},

  --Copilot
   {'github/copilot.vim'},
}

