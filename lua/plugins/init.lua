return
{
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },
  {'wuelnerdotexe/vim-astro'},
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
  {"nyoom-engineering/oxocarbon.nvim"},
  {"bluz71/vim-moonfly-colors"},
  {"kartikp10/noctis.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },
  {"EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
          groups = {
            all = {
              --[[ DiagnosticVirtualTextError = { fg = "#e85c51" } ]]
              DiagnosticVirtualTextError = { link = "DiagnosticError"},
              DiagnosticVirtualTextWarn = { link = "DiagnosticWarn"},
              DiagnosticVirtualTextInfo = { link = "DiagnosticInfo"},
              DiagnosticVirtualTextHint = { link = "DiagnosticHint"},
            }
          }
        })
    end
    },
  --Color control 
  {"echasnovski/mini.nvim", version = '*'},
  --CMP

 { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" }, -- The completion plugin
   { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
   { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }, -- path completions
	 { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }, -- snippet completions
	 { "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" },
	 { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" },  -- snippets
  {"L3MON4D3/LuaSnip",
    config = function()
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascriptreact", { "html" })
      require("luasnip/loaders/from_vscode").lazy_load()
     end,
    }, --snippet engine
  {"rafamadriz/friendly-snippets"}, -- a bunch of snippets to use,

	-- LSP
  {"neovim/nvim-lspconfig"}, -- enable LSP
   {'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim'},
  {"neovim/nvim-lsp"},
  {"Omnisharp/omnisharp-vim"},
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
    {
      "folke/ts-comments.nvim",
      opts = {},
      event = "VeryLazy",
      enabled = true,
    },
   {"Pocco81/auto-save.nvim"},
   { "mfussenegger/nvim-jdtls", ft = { "java" }},
   {"HiPhish/gradle.nvim"},
   {"akinsho/bufferline.nvim"},
   {"moll/vim-bbye"},
 -- --Buffers
 -- --Impatient
 {'lewis6991/impatient.nvim'},
 ----Lualine
 --  {
 -- 'nvim-lualine/lualine.nvim',
 --  dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
 -- },
 -- --ToggleTerm
 { "akinsho/toggleterm.nvim"},
 --editor 
 --[[ { ]]
 --[[   "folke/trouble.nvim", ]]
 --[[   opts = {}, -- for default options, refer to the configuration section for custom setup. ]]
 --[[   cmd = "Trouble", ]]
 --[[   keys = { ]]
 --[[     { ]]
 --[[       "<leader>xx", ]]
 --[[       "<cmd>Trouble diagnostics toggle<cr>", ]]
 --[[       desc = "Diagnostics (Trouble)", ]]
 --[[     }, ]]
 --[[     { ]]
 --[[       "<leader>xX", ]]
 --[[       "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", ]]
 --[[       desc = "Buffer Diagnostics (Trouble)", ]]
 --[[     }, ]]
 --[[     { ]]
 --[[       "<leader>cs", ]]
 --[[       "<cmd>Trouble symbols toggle focus=false<cr>", ]]
 --[[       desc = "Symbols (Trouble)", ]]
 --[[     }, ]]
 --[[     { ]]
 --[[       "<leader>cl", ]]
 --[[       "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", ]]
 --[[       desc = "LSP Definitions / references / ... (Trouble)", ]]
 --[[     }, ]]
 --[[     { ]]
 --[[       "<leader>xL", ]]
 --[[       "<cmd>Trouble loclist toggle<cr>", ]]
 --[[       desc = "Location List (Trouble)", ]]
 --[[     }, ]]
 --[[     { ]]
 --[[       "<leader>xQ", ]]
 --[[       "<cmd>Trouble qflist toggle<cr>", ]]
 --[[       desc = "Quickfix List (Trouble)", ]]
 --[[     }, ]]
 --[[   }, ]]
 --[[ }, ]]
 --[[ { ]]
 --[[   "folke/todo-comments.nvim", ]]
 --[[   dependencies = { "nvim-lua/plenary.nvim" }, ]]
 --[[   opts = { ]]
 --[[     -- your configuration comes here ]]
 --[[     -- or leave it empty to use the default settings ]]
 --[[     -- refer to the configuration section below ]]
 --[[   } ]]
 --[[ }, ]]
 --[[ --ts-autotag  ]]
 --[[ {"windwp/nvim-ts-autotag"}, ]]
 --[[ --persistence ]]
 --[[ { ]]
 --[[   "folke/persistence.nvim", ]]
 --[[   event = "BufReadPre", -- this will only start session saving when an actual file was opened ]]
 --[[   opts = { ]]
 --[[       need = 0 ]]
 --[[     -- add any custom options here ]]
 --[[   } ]]
 --[[ }, ]]
 --Copilot
  {'github/copilot.vim'},
}
