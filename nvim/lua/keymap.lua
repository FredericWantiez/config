local map = require("utils").map

vim.g.mapleader = ","

map("n", "<Space>", ":nohlsearch<CR>", { silent = true })
map("n", "<Leader>w", ":w<CR>", { silent = true })
map("n", "<Leader>e", ":Ex<CR>", { silent = true })
map("n", "<Leader>c", ":q<CR>", { silent = true })

map("i", "jk", "<Esc>", { silent = true })
map("i", "<Leader>s", "<Esc>:w<CR>", { silent = true })
