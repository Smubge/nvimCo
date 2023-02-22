vim.opt.shell = 'pwsh'
vim.opt.shellcmdflag = '-nologo -noprofile -ExecutionPolicy RemoteSigned -command'
vim.opt.shellxquote = ''

vim.cmd "set shell=powershell"
vim.cmd "set shellcmdflag=-command"
vim.cmd "set shellquote=\" " 
vim.cmd "set shellxquote= "

require "user.autocommands"
require "user.options"
require "user.lazy"
require "user.lsp"
require "user.cmp"
require "user.keymaps"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comments"
require "user.nvim-tree"
require "user.alpha"
require "user.project"
require "user.rust-tools"
require "user.bufferLine"
require "user.impatient"
require "user.lualine"
require "user.toggleterm"
require "user.gitsigns"
vim.cmd "colorscheme dracula"
vim.cmd "colorscheme dracula"

