local options = {
    backup = false,
    clipboard= "unnamedplus",
    cmdheight = 2,
    completeopt = {"menuone", "noselect"},
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    mouse = "a",
    pumheight = 10,
    showmode = true,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    swapfile = false,
    timeoutlen = 300,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    cursorline = true,
    number = true,
    relativenumber = false,
    numberwidth = 4,

    signcolumn = "yes",
    wrap = true,
    linebreak = true,
    scrolloff = 8,
    sidescrolloff = 8,
    guifont = "FiraCode Nerd Font:h8"
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do 
    vim.opt[k] = v 
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=- ]]
-- vim.cmd [[set formatoptions-=cro]]
