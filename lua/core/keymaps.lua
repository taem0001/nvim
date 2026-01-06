local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Make <Space> do nothing in normal mode (leader already set in init.lua)
map("n", "<Space>", "<Nop>", opts)

-- Basic stuff
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map({"n", "v"}, "<C-c>", '"+y', { desc = "Yank to clipboard" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Fast save & compile/run (commands are defined in core.commands)
map("n", "<leader>m", ":Make<CR>", opts) -- build
map("n", "<leader>r", ":Run<CR>", opts)  -- run ./a.out
