local opts = {noremap = true, silent = true }

local term_opts = {silent = true}

--Shorten function name
local keymap = vim.api.nvim_set_keymap
 
keymap("", "<Space>", "<Nop>", opts)


--Normal -- 
--Better window navigation 

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--//Quality of life
--Telescope
keymap("n", "tf", ":Telescope find_files<CR>", opts)
keymap("n", "tl", ":Telescope live_grep<CR>", opts)
keymap("n", "tb", ":Telescope buffers<CR>", opts)
keymap("n", "tg", ":Telescope current_buffer_fuzzy_find<CR>", opts)



--Tree Toggle
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", term_opts)
--Show Diagnostics (Shows details on errors / warnings / TODOs)
keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
--Exit Buffer
keymap('n', '<S-w>', ':Bdelete!<CR>', opts)
--CodeAction
keymap("n", "ga", ":CodeActionMenu<CR>", opts);
--AutoSaveToggle (Why did I make it space + n?)
keymap("n", "<leader>n", ":ASToggle<CR>", {})
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

--Move text up and down
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--Lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "gm", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<space><space>", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "C-k", vim.lsp.buf.signature_help, opts)

vim.g.copilot_no_tab_map = true
vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
